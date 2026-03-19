<#import "/assets/icons/chevron-down.ftl" as icon>
<#import "/components/atoms/link.ftl" as link>

<#macro kw currentLocale="" locales=[]>
  <div class="ac-locale" x-data="{ open: false }">
    <@link.kw
      @click="open = !open"
      aria\-expanded="false"
      aria\-haspopup="listbox"
      color="secondary"
      component="button"
      type="button"
    >
      <span class="ac-locale-current">${currentLocale}</span>
      <@icon.kw />
    </@link.kw>
    <div
      @click.away="open = false"
      class="ac-locale-menu"
      x-cloak
      x-show="open"
    >
      <#list locales as localeItem>
        <#if currentLocale != localeItem.label>
          <div class="ac-locale-item">
            <@link.kw color="secondary" href=localeItem.url size="small">
              ${localeItem.label}
            </@link.kw>
          </div>
        </#if>
      </#list>
    </div>
  </div>
</#macro>
