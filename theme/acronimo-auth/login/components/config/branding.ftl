<#function firstNonEmpty candidates>
  <#list candidates as candidate>
    <#assign raw=(candidate?string)!"">
    <#assign value=raw?trim>
    <#if value?has_content>
      <#return value>
    </#if>
  </#list>
  <#return "">
</#function>

<#function safeCssColor value fallback>
  <#if value?has_content>
    <#assign trimmed=value?trim>
    <#if trimmed?matches("^#[0-9a-fA-F]{3,8}$")>
      <#return trimmed>
    </#if>
    <#if trimmed?matches("^(rgb|hsl)a?\\([0-9%,.\\s]+\\)$")>
      <#return trimmed>
    </#if>
  </#if>
  <#return fallback>
</#function>

<#function safeCssLength value fallback>
  <#if value?has_content>
    <#assign trimmed=value?trim>
    <#if trimmed?matches("^[0-9]+(\\.[0-9]+)?(px|rem|em|%)$")>
      <#return trimmed>
    </#if>
  </#if>
  <#return fallback>
</#function>

<#function resolveAssetUrl value fallback>
  <#assign raw=firstNonEmpty([value, fallback])>
  <#if !raw?has_content>
    <#return "">
  </#if>

  <#if raw?starts_with("https://") || raw?starts_with("http://") || raw?starts_with("/")>
    <#return raw>
  </#if>

  <#return url.resourcesPath + "/" + raw>
</#function>

<#function resolve>
  <#assign realmAttrs=((realm.attributes)!{})>
  <#assign clientAttrs=((client.attributes)!{})>

  <#assign productName=firstNonEmpty([
    clientAttrs["brand.productName"]!"",
    clientAttrs["brand.name"]!"",
    clientAttrs["product.name"]!"",
    realmAttrs["brand.productName"]!"",
    realmAttrs["brand.name"]!"",
    realmAttrs["product.name"]!"",
    (client.name)!"",
    (client.clientId)!"",
    (realm.displayName)!"",
    properties.brandDefaultProductName!"",
    "Acronimo Cloud"
  ])>

  <#assign shortCopy=firstNonEmpty([
    clientAttrs["brand.copyBrief"]!"",
    clientAttrs["product.copyBrief"]!"",
    realmAttrs["brand.copyBrief"]!"",
    realmAttrs["product.copyBrief"]!"",
    properties.brandDefaultCopyBrief!"",
    "Secure Sign-In"
  ])>

  <#assign logoUrl=resolveAssetUrl(
    firstNonEmpty([
      clientAttrs["brand.logo"]!"",
      clientAttrs["product.logo"]!"",
      realmAttrs["brand.logo"]!"",
      realmAttrs["product.logo"]!"",
      properties.brandDefaultLogo!""
    ]),
    "brand/acronimo-logo.svg"
  )>

  <#assign faviconUrl=resolveAssetUrl(
    firstNonEmpty([
      clientAttrs["brand.favicon"]!"",
      clientAttrs["product.favicon"]!"",
      realmAttrs["brand.favicon"]!"",
      realmAttrs["product.favicon"]!"",
      properties.brandDefaultFavicon!""
    ]),
    "brand/favicon.svg"
  )>

  <#assign primaryColor=safeCssColor(firstNonEmpty([
    clientAttrs["brand.color.primary"]!"",
    clientAttrs["product.color.primary"]!"",
    realmAttrs["brand.color.primary"]!"",
    realmAttrs["product.color.primary"]!"",
    properties.brandDefaultPrimaryColor!""
  ]), "#0A5DFF")>

  <#assign primaryHoverColor=safeCssColor(firstNonEmpty([
    clientAttrs["brand.color.primaryHover"]!"",
    clientAttrs["product.color.primaryHover"]!"",
    realmAttrs["brand.color.primaryHover"]!"",
    realmAttrs["product.color.primaryHover"]!"",
    properties.brandDefaultPrimaryHoverColor!""
  ]), "#0048CC")>

  <#assign textColor=safeCssColor(firstNonEmpty([
    clientAttrs["brand.color.text"]!"",
    realmAttrs["brand.color.text"]!"",
    properties.brandDefaultTextColor!""
  ]), "#102038")>

  <#assign mutedTextColor=safeCssColor(firstNonEmpty([
    clientAttrs["brand.color.textMuted"]!"",
    realmAttrs["brand.color.textMuted"]!"",
    properties.brandDefaultTextMutedColor!""
  ]), "#5E6C84")>

  <#assign bgColor=safeCssColor(firstNonEmpty([
    clientAttrs["brand.color.background"]!"",
    realmAttrs["brand.color.background"]!"",
    properties.brandDefaultBackgroundColor!""
  ]), "#F3F7FF")>

  <#assign surfaceColor=safeCssColor(firstNonEmpty([
    clientAttrs["brand.color.surface"]!"",
    realmAttrs["brand.color.surface"]!"",
    properties.brandDefaultSurfaceColor!""
  ]), "#FFFFFF")>

  <#assign borderColor=safeCssColor(firstNonEmpty([
    clientAttrs["brand.color.border"]!"",
    realmAttrs["brand.color.border"]!"",
    properties.brandDefaultBorderColor!""
  ]), "#D7E0EE")>

  <#assign focusColor=safeCssColor(firstNonEmpty([
    clientAttrs["brand.color.focus"]!"",
    realmAttrs["brand.color.focus"]!"",
    properties.brandDefaultFocusColor!""
  ]), "#0A5DFF")>

  <#assign radius=safeCssLength(firstNonEmpty([
    clientAttrs["brand.radius"]!"",
    realmAttrs["brand.radius"]!"",
    properties.brandDefaultRadius!""
  ]), "14px")>

  <#assign modeRaw=firstNonEmpty([
    clientAttrs["brand.mode"]!"",
    clientAttrs["product.mode"]!"",
    realmAttrs["brand.mode"]!"",
    realmAttrs["product.mode"]!"",
    properties.brandDefaultMode!""
  ])?lower_case>

  <#assign mode=(modeRaw == "light" || modeRaw == "dark")?then(modeRaw, "auto")>

  <#return {
    "name": productName,
    "shortCopy": shortCopy,
    "logoUrl": logoUrl,
    "faviconUrl": faviconUrl,
    "primaryColor": primaryColor,
    "primaryHoverColor": primaryHoverColor,
    "textColor": textColor,
    "mutedTextColor": mutedTextColor,
    "bgColor": bgColor,
    "surfaceColor": surfaceColor,
    "borderColor": borderColor,
    "focusColor": focusColor,
    "radius": radius,
    "mode": mode
  }>
</#function>
