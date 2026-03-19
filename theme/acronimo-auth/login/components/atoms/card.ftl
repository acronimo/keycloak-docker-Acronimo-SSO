<#macro kw content="" footer="" header="">
  <section class="ac-card" aria-label="${msg('acronimoSignInCardLabel')}">
    <#if header?has_content>
      <header class="ac-card-section ac-card-header">
        ${header}
      </header>
    </#if>
    <#if content?has_content>
      <div class="ac-card-section ac-card-content">
        ${content}
      </div>
    </#if>
    <#if footer?has_content>
      <footer class="ac-card-section ac-card-footer">
        ${footer}
      </footer>
    </#if>
  </section>
</#macro>
