<#macro kw color="">
  <#switch color>
    <#case "error">
      <#assign colorClass="ac-alert-error">
      <#break>
    <#case "success">
      <#assign colorClass="ac-alert-success">
      <#break>
    <#case "warning">
      <#assign colorClass="ac-alert-warning">
      <#break>
    <#default>
      <#assign colorClass="ac-alert-info">
  </#switch>

  <div class="ac-alert ${colorClass}" role="alert">
    <#nested>
  </div>
</#macro>
