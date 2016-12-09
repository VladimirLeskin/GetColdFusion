<cfset Session.user_id = 0>
<cfset Session.login = "">
<cfset Session.first_name = "">
<cfset Session.last_name = "">
<cflocation url="login.cfm" addtoken="false" >