<!--- Check if both passwords are equal --->
<cfif #form.password# NOT EQUAL #form.password2# >
	Passwords do not match
	<a href="/TestTaskLeskin/users.cfm">get back</a>
	<cfexit >
</cfif>

<!--- hash password with md5 --->
<cfset password = Hash(#form.password#)>

<!--- Check if this login already exists --->
<cfquery name="get_login_query" datasource="mydata">
	SELECT login FROM users WHERE login = <cfqueryparam  value="#form.login#">
</cfquery>

<cfif get_login_query.RecordCount GT 0>
	This login has already been taken
	<br>
	<a href="/TestTaskLeskin/users.cfm">get back</a>
	<cfexit >
</cfif>

<cfquery name="add_user_query" datasource="mydata" result="insert_result">
	INSERT INTO users (login, password, first_name, last_name) VALUES(
			<cfqueryparam value="#form.login#" cfsqltype="cf_sql_varchar">,
			<cfqueryparam value="#password#" cfsqltype="cf_sql_varchar" >,
			<cfqueryparam value="#form.first_name#" cfsqltype="cf_sql_varchar" >,
			<cfqueryparam value="#form.last_name#" cfsqltype="cf_sql_varchar" >
		)
</cfquery>
<cfif #insert_result.generatedkey# GT 0>
	<cfset Session.user_id = #insert_result.generatedkey#>
	<cfset Session.first_name = #form.first_name#>
	<cfset Session.last_name = #form.last_name#>
	<cfset Session.login = #form.login#> 
	<cflocation url="/TestTaskLeskin/login.cfm" addtoken="false" >
<cfelse>
	ERROR, try again later
</cfif>