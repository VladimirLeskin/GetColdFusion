<!--- Checking if user is logged in --->
<cfif not IsDefined("Session.user_id") >
	<cfoutput >
		<a href="login.cfm">
			Authorize first
		</a>
		<cfexit />
	</cfoutput>
<cfelseif #Session.user_id# LTE 0>
	<cfoutput >
		<a href="login.cfm">
			Authorize first
		</a>
		<cfexit />
	</cfoutput>
</cfif>
<!--- /Checking if user is logged in --->

<!--- Update bug attributes --->
<cfquery name="edit_bug_query" datasource="mydata">
	 UPDATE bugs SET status = <cfqueryparam value="#form.status#" cfsqltype="cf_sql_char" />,
	 				 short_description = <cfqueryparam value="#form.short_description#" cfsqltype="cf_sql_varchar" />,
	 				 full_description = <cfqueryparam value="#form.full_description#" cfsqltype="cf_sql_text" />,
	 				 user_id = <cfqueryparam value="#Session.user_id#" cfsqltype="cf_sql_int" />,
	 				 urgency = <cfqueryparam value="#form.urgency#" cfsqltype="cf_sql_char" />,
	 				 criticality = <cfqueryparam value="#form.criticality#" cfsqltype="cf_sql_char" />
	 WHERE bug_id = <cfqueryparam value="#form.bug_id#"  >
</cfquery>

<!--- Write new action into history --->
<cfquery name="add_to_bug_hstory_query" datasource="mydata">
	INSERT INTO bugs_history (bug_id, user_id, action, comment) VALUES(
			<cfqueryparam value="#form.bug_id#" >,
			<cfqueryparam value="#Session.user_id#" cfsqltype="cf_sql_integer" >,
			<cfqueryparam value="#form.status#" cfsqltype="cf_sql_char" >,
			<cfqueryparam value="#form.comment#" cfsqltype="cf_sql_varchar" >
		)
</cfquery>
<cflocation url="bugs_list.cfm" addtoken="false" >