<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false displayInfo=false; section>
    
    <#-- HEADER (leave empty) --------------------------------------------- -->
    <#if section == "header">
        
    <#-- FORM SECTION (HIDDEN) -------------------------------------------- -->
    <#elseif section == "form">
        <style>
            /* Hide the username/password form cleanly */
            #kc-form, #kc-registration-container {
                display: none !important;
            }
            
            /* Make the login buttons bigger */
            .kc-social-links a,
            #kc-social-providers a {
                font-size: 1.6em !important;
                font-weight: 700 !important;
                padding: 18px 24px !important;
                color: rgb(57, 126, 190) !important;
                border: 3px solid #000 !important;
            }
        </style>
        
        <script>
            /* Change browser tab title based on client */
            <#if client.clientId?contains("servicex")>
                document.title = "ServiceX Login";
            <#elseif client.clientId?contains("servicey")>
                document.title = "ServiceY Login";
            <#else>
                document.title = "ServiceX Login";
            </#if>
        </script>
    
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
                
                <!-- PUT THE HEADER HERE INSIDE THE CARD -->
                <h1 style="text-align: center; font-size: 2.5em; font-weight: 600; margin: 20px 0 40px 0; color: #333;">
                    <#if client.clientId?contains("servicex")>
                        ServiceX
                    <#elseif client.clientId?contains("servicey")>
                        ServiceY
                    <#else>
                        ServiceX
                    </#if>
                </h1>
                
                <hr style="border: 0; height: 3px; background-color: #999; margin: 30px 0;"/>
                <p style="text-align:center; font-size:1.5em; margin-bottom:2.5rem; font-weight: 500;">
                    Sign in with
                </p>
                <ul class="${properties.kcFormSocialAccountListClass!}
                           <#if social.providers?size gt 3>
                               ${properties.kcFormSocialAccountListGridClass!}
                           </#if>"
                    style="margin-bottom: 1.5rem;">
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
                <hr style="border: none; height: 3px; background-color: #999; margin: 30px 0 0 0; box-shadow: none;"/>
                
                <!-- BOTTOM LOGOS -->
                <div class="bottom-logos">
                    <img src="${url.resourcesPath}/img/ATLAS-logo.png" alt="ATLAS" />
                    <img src="${url.resourcesPath}/img/Iris-hep-4-no-long-name.png" alt="IRIS-HEP" />
                    <img src="${url.resourcesPath}/img/Maniac_Logo_extended.png" alt="MANIAC" />
                </div>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>