<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false displayInfo=false; section>
    
    <#-- PAGE TITLE (browser tab) ----------------------------------------- -->
    <#if section == "title">
        <#if client.clientId?contains("servicex")>
            ServiceX Login
        <#elseif client.clientId?contains("servicey")>
            ServiceY Login
        <#else>
            ServiceX Login
        </#if>
    
    <#-- HEADER ------------------------------------------------------------ -->
    <#elseif section == "header">
        <#-- Dynamic header based on client ID -->
        <#if client.clientId?contains("servicex")>
            ServiceX
        <#elseif client.clientId?contains("servicey")>
            ServiceY
        <#else>
            ServiceX  <#-- Default fallback -->
        </#if>
    <#-- FORM SECTION (HIDDEN) -------------------------------------------- -->
    <#elseif section == "form">
        <style>
            /* Hide the username/password form cleanly */
            #kc-form, #kc-registration-container {
                display: none !important;
            }
        </style>
    <#-- INFO SECTION (HIDDEN) --------------------------------------------- -->
    <#elseif section == "info">
        <style>
            #kc-info {
                display: none !important;
            }
        </style>
    <#-- SOCIAL PROVIDERS (IdPs) ------------------------------------------- -->
    <#elseif section == "socialProviders">
        <#if social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <hr/>
                <p style="text-align:center; font-size:1.1em; margin-bottom:1.2rem;">
                    <strong>Login</strong>
                </p>
                <ul class="${properties.kcFormSocialAccountListClass!}
                           <#if social.providers?size gt 3>
                               ${properties.kcFormSocialAccountListGridClass!}
                           </#if>">
                    <#list social.providers as p>
                        <li>
                            <a id="social-${p.alias}"
                               class="${properties.kcFormSocialAccountListButtonClass!}
                                      <#if social.providers?size gt 3>
                                          ${properties.kcFormSocialAccountGridItem!}
                                      </#if>"
                               href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}"
                                       aria-hidden="true"></i>
                                </#if>
                                <span class="${properties.kcFormSocialAccountNameClass!}">
                                    ${p.displayName!}
                                </span>
                            </a>
                        </li>
                    </#list>
                </ul>
                <#-- BOTTOM LOGOS ------------------------------------------ -->
                <div class="bottom-logos">
                    <img src="${url.resourcesPath}/img/ATLAS-logo.png" alt="ATLAS" />
                    <img src="${url.resourcesPath}/img/Iris-hep-4-no-long-name.png" alt="IRIS-HEP" />
                    <img src="${url.resourcesPath}/img/Maniac_Logo_extended.png" alt="MANIAC" />
                </div>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>