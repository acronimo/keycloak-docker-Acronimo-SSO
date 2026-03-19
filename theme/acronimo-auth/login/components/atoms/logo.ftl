<#macro kw brand>
  <div class="ac-brand">
    <img alt="${msg('acronimoBrandLogoAlt', brand.name)}" class="ac-brand-logo" src="${brand.logoUrl}">
    <div class="ac-brand-name">
      <#nested>
    </div>
  </div>
</#macro>
