<#import "template.ftl" as layout>

<@layout.registrationLayout displayMessage=false displayInfo=false; section>

    <#-- HEADER ------------------------------------------------------------ -->
    <#if section == "header">
        ${msg("loginAccountTitle")}

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
                    <strong>Please sign in using your institutional login.</strong>
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
            </div>
        </#if>

    </#if>

</@layout.registrationLayout>

