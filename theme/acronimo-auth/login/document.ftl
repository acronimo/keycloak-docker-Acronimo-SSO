<#macro kw brand script="">
  <title>${msg("loginTitle", (brand.name!realm.displayName!""))}</title>

  <meta charset="utf-8">
  <meta name="robots" content="noindex, nofollow">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <#if properties.meta?has_content>
    <#list properties.meta?split(" ") as meta>
      <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}">
    </#list>
  </#if>

  <link href="${brand.faviconUrl}" rel="icon" type="image/svg+xml">

  <#if properties.styles?has_content>
    <#list properties.styles?split(" ") as style>
      <link href="${url.resourcesPath}/${style}" rel="stylesheet">
    </#list>
  </#if>

  <style>
    :root {
      --ac-color-primary: ${brand.primaryColor};
      --ac-color-primary-hover: ${brand.primaryHoverColor};
      --ac-color-text: ${brand.textColor};
      --ac-color-text-muted: ${brand.mutedTextColor};
      --ac-color-background: ${brand.bgColor};
      --ac-color-surface: ${brand.surfaceColor};
      --ac-color-border: ${brand.borderColor};
      --ac-color-focus: ${brand.focusColor};
      --ac-radius: ${brand.radius};
      --ac-shadow-card: 0 20px 48px rgba(16, 32, 56, 0.14);
      --ac-font-sans: "Inter", "Avenir Next", "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    }

    html[data-theme="dark"] {
      --ac-color-text: #f5f8ff;
      --ac-color-text-muted: #bfd0f7;
      --ac-color-background: #0d1626;
      --ac-color-surface: #16243a;
      --ac-color-border: #2f4364;
      --ac-shadow-card: 0 22px 54px rgba(0, 0, 0, 0.42);
    }

    <#if brand.mode == "auto">
      @media (prefers-color-scheme: dark) {
        :root {
          --ac-color-text: #f5f8ff;
          --ac-color-text-muted: #bfd0f7;
          --ac-color-background: #0d1626;
          --ac-color-surface: #16243a;
          --ac-color-border: #2f4364;
          --ac-shadow-card: 0 22px 54px rgba(0, 0, 0, 0.42);
        }
      }
    </#if>
  </style>

  <#if script?has_content>
    <script defer src="${url.resourcesPath}/${script}" type="module"></script>
  </#if>

  <#if properties.scripts?has_content>
    <#list properties.scripts?split(" ") as scriptPath>
      <script defer src="${url.resourcesPath}/${scriptPath}" type="module"></script>
    </#list>
  </#if>
</#macro>
