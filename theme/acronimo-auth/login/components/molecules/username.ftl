<#import "/assets/icons/arrow-top-right-on-square.ftl" as icon>
<#import "/components/atoms/link.ftl" as link>

<#macro kw linkHref="" linkTitle="" name="">
  <div class="ac-username-row">
    <span class="ac-username-value">${name}</span>
    <@link.kw
      color="primary"
      href=linkHref
      title=linkTitle
    >
      <@icon.kw />
    </@link.kw>
  </div>
</#macro>
