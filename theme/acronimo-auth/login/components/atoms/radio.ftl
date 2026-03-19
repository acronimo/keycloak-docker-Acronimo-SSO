<#macro kw checked=false id="" label="" rest...>
  <div class="ac-radio-row">
    <input
      <#if checked>checked</#if>

      class="ac-radio"
      id="${id}"
      type="radio"

      <#list rest as attrName, attrValue>
        ${attrName}="${attrValue}"
      </#list>
    >
    <label class="ac-radio-label" for="${id}">
      ${label}
    </label>
  </div>
</#macro>
