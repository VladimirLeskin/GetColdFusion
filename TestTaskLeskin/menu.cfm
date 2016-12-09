<link href="style.css" rel="stylesheet" media="all"></link>
<!---Left box with login info --->
<div class="user_info">
	<cfoutput >
		<cfif #Session.login# NOT EQUAL "">
			<p>Login: #Session.login#</p>
			<p>#Session.first_name# #Session.last_name#</p>
			<p>
				<a href="logout.cfm">Logout</a>
			</p>
		<cfelse>
			<a href="login.cfm">
				Login
			</a>	
		</cfif>
	</cfoutput>
</div>
<!--- /Left box with login info --->
<div class="menu">
	<ul class="menu_list">
		<li class="menu_list_item">
			<a href="/TestTaskLeskin/register_bug.cfm"><div>Register new bug</div></a>
		</li>
		
		<li class="menu_list_item">
			<a href="/TestTaskLeskin/bugs_list.cfm"><div>Bugs list<div></a>
		</li>
		
		<li class="menu_list_item">
			<a href="/TestTaskLeskin/login.cfm"><div>Login</div></a>
		</li>
		
		<li class="menu_list_item">
			<a href="/TestTaskLeskin/users.cfm"><div>Users</div></a>
		</li>
	</ul>
</div>