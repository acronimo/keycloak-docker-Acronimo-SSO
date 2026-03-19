<#macro kw checked=false label="" name="" rest...>
  <div class="ac-check-row">
    <input
      <#if checked>checked</#if>

      class="ac-check"
      id="${name}"
      name="${name}"
      type="checkbox"

      <#list rest as attrName, attrValue>
        ${attrName}="${attrValue}"
      </#list>
    >
    <label class="ac-check-label" for="${name}">
      ${label}
    </label>
  </div>
</#macro>
