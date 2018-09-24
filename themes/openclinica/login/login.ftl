<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        <div class="kc-logo-text"></div>
    <#elseif section = "form">
    <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
      <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">

                    <div class="${properties.kcFormLoginOc!}">
                        <span>
                            <svg focusable="false" width="13px" height="14px" viewBox="0 0 15 16" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="icon-svg"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g transform="translate(-11.000000, -1471.000000)" fill="#888888"><path d="M25.552,1486.998 L11.449,1486.998 C10.667,1485.799 10.984,1483.399 11.766,1482.6 C12.139,1482.219 14.931,1481.5 16.267,1481.172 C14.856,1480.076 13.995,1478.042 13.995,1476.103 C13.995,1473.284 14.813,1470.999 18.498,1470.999 C22.182,1470.999 23,1473.284 23,1476.103 C23,1478.037 22.145,1480.065 20.74,1481.163 C22.046,1481.489 24.88,1482.228 25.241,1482.601 C26.019,1483.399 26.328,1485.799 25.552,1486.998 L25.552,1486.998 Z M24.6,1483.443 C24.087,1483.169 21.881,1482.548 20,1482.097 L20,1480.513 C21.254,1479.659 21.997,1477.806 21.997,1476.12 C21.997,1473.841 21.414,1471.993 18.499,1471.993 C15.583,1471.993 15,1473.841 15,1476.12 C15,1477.807 15.744,1479.662 17,1480.515 L17,1482.112 C15.109,1482.556 12.914,1483.166 12.409,1483.442 C12.082,1483.854 11.797,1485.173 12,1486 L25,1486 C25.201,1485.174 24.922,1483.858 24.6,1483.443 L24.6,1483.443 Z"></path></g></g></svg>
                        </span>

                        <#if usernameEditDisabled??>
                            <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" placeholder="${msg("usernameOrEmail")}" disabled />
                        <#else>
                            <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" placeholder="${msg("usernameOrEmail")}" autofocus autocomplete="off" />
                        </#if>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">

                    <div class="${properties.kcFormLoginOc!}">
                        <span>
                            <svg focusable="false" width="11px" height="14px" viewBox="0 0 13 16" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="icon-svg"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g transform="translate(-288.000000, -1508.000000)" fill="#888888"><path d="M299,1523.998 L290,1523.998 C288.896,1523.998 288,1523.102 288,1521.999 L288,1515.999 C288,1514.895 288.896,1513.998 290,1513.998 L290,1513.998 L290,1512.499 C290,1510.015 292.015,1507.999 294.5,1507.999 C296.985,1507.999 299,1510.015 299,1512.499 L299,1513.999 C300.104,1513.999 301,1514.895 301,1515.999 L301,1521.999 C301,1523.103 300.104,1523.998 299,1523.998 L299,1523.998 Z M298,1512.499 C298,1510.566 296.433,1508.999 294.5,1508.999 C292.567,1508.999 291,1510.566 291,1512.499 L291,1513.998 L298,1513.998 L298,1512.499 L298,1512.499 Z M300,1515.999 C300,1515.446 299.552,1514.998 299,1514.998 L290,1514.998 C289.447,1514.998 289,1515.446 289,1515.999 L289,1521.999 C289,1522.551 289.447,1522.998 290,1522.998 L299,1522.998 C299.552,1522.998 300,1522.551 300,1521.999 L300,1515.999 L300,1515.999 Z M294.5,1520.998 C294.224,1520.998 294,1520.774 294,1520.498 L294,1517.498 C294,1517.223 294.224,1516.999 294.5,1516.999 C294.776,1516.999 295,1517.223 295,1517.498 L295,1520.498 C295,1520.774 294.776,1520.998 294.5,1520.998 L294.5,1520.998 Z"></path></g></g></svg>
                        </span>
                        
                        <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" placeholder="${msg("password")}" />
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                        </div>
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>

                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormGroupClass!} ${properties.kcFormGroupLogin!}">
                        <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} ${properties.kcButtonLogin!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                    </div>
                </div>
            </form>
        </#if>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                    <#list social.providers as p>
                        <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
        </div>
      </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
