<#macro kw color="" component="button" size="" rest...>
  <#switch color>
    <#case "secondary">
      <#assign colorClass="ac-button-secondary">
      <#break>
    <#default>
      <#assign colorClass="ac-button-primary">
  </#switch>

  <#switch size>
    <#case "small">
      <#assign sizeClass="ac-button-small">
      <#break>
    <#default>
      <#assign sizeClass="ac-button-medium">
  </#switch>

  <${component}
    class="ac-button ${colorClass} ${sizeClass}"

    <#list rest as attrName, attrValue>
      ${attrName}="${attrValue}"
    </#list>
  >
    <#nested>
  </${component}>
</#macro>
