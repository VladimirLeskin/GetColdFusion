<!--- Checking if user is logged in --->
<cfif not IsDefined("Session.user_id")>
	<cfoutput >
		<a href="login.cfm">
			Authorize first
		</a>
		<cfexit />
	</cfoutput>
<cfelseif #Session.user_id# LTE 0>
	<a href="login.cfm">
		Authorize first
	</a>
	<cfexit />
</cfif>
<!--- /Checking if user is logged in --->

<!--- Create new row in bugs table of DB --->
<cfquery name="register_bug_query" datasource="mydata" result="insert_result">
	INSERT INTO bugs (status, short_description, full_description, user_id, urgency, criticality) VALUES (
		'N',
		<cfqueryparam value="#form.short_description#" cfsqltype="cf_sql_varchar" />,
		<cfqueryparam value="#form.full_description#" cfsqltype="cf_sql_text" />,
		<cfqueryparam value="#Session.user_id#" cfsqltype="cf_sql_int" />,
		<cfqueryparam value="#form.urgency#" cfsqltype="cf_sql_char" />,
		<cfqueryparam value="#form.criticality#" cfsqltype="cf_sql_char" />
	)
</cfquery>
<cfoutput >
	<cfset bug_id = insert_result.generatedkey>
</cfoutput>

<!--- Write this action in bug history --->
<cfquery name="add_to_bug_hstory_query" datasource="mydata">
	INSERT INTO bugs_history (bug_id, user_id, action, comment) VALUES(
			<cfqueryparam value="#bug_id#" >,
			<cfqueryparam value="#Session.user_id#" cfsqltype="cf_sql_integer" >,
			'N',
			<cfqueryparam value="#form.comment#" cfsqltype="cf_sql_varchar" >
		)
</cfquery>
<cflocation url="bugs_list.cfm" addtoken="false" >