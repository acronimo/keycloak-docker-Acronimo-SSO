<#macro kw color="" component="a" size="" rest...>
  <#switch color>
    <#case "secondary">
      <#assign colorClass="ac-link-secondary">
      <#break>
    <#default>
      <#assign colorClass="ac-link-primary">
  </#switch>

  <#switch size>
    <#case "small">
      <#assign sizeClass="ac-link-small">
      <#break>
    <#default>
      <#assign sizeClass="">
  </#switch>

  <${component}
    class="ac-link ${colorClass} ${sizeClass}"

    <#list rest as attrName, attrValue>
      ${attrName}="${attrValue}"
    </#list>
  >
    <#nested>
  </${component}>
</#macro>
