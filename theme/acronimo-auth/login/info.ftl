<#import "template.ftl" as layout>
<#import "components/atoms/link.ftl" as link>

<@layout.registrationLayout displayMessage=false; section>
  <#if section="header">
    ${kcSanitize(messageHeader!msg("acronimoInfoTitle"))?no_esc}
  <#elseif section="form">
    <div class="space-y-4">
      <#if message?has_content && message.summary?has_content>
        <p>${kcSanitize(message.summary)?no_esc}</p>
      <#else>
        <p>${msg("acronimoInfoBody")}</p>
      </#if>
    </div>
  <#elseif section="nav">
    <@link.kw color="secondary" href=url.loginUrl size="small">
      ${kcSanitize(msg("backToLogin"))?no_esc}
    </@link.kw>
  </#if>
</@layout.registrationLayout>
