<#import "/assets/providers/providers.ftl" as providerIcons>

<#macro kw providers=[]>
  <div class="ac-idp-title">
    ${msg("identity-provider-login-label")}
  </div>
  <div class="ac-idp-grid" role="list">
    <#list providers as provider>
      <a
        class="ac-idp-item"
        data-provider="${provider.alias}"
        href="${provider.loginUrl}"
        role="listitem"
      >
        <#if providerIcons[provider.alias]??>
          <div aria-hidden="true" class="ac-idp-icon">
            <@providerIcons[provider.alias] />
          </div>
          <span class="sr-only">${provider.displayName!provider.alias}</span>
        <#else>
          <span>${provider.displayName!provider.alias}</span>
        </#if>
      </a>
    </#list>
  </div>
</#macro>
