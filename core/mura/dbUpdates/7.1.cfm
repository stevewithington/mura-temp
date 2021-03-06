<cfscript>
    getBean('entity').checkSchema();
    dbUtility.setTable("tsettings")
    .addColumn(column="scaffolding",dataType="int");
</cfscript>

<cfquery name="rsCheck">
select siteID from tsettings where siteid not in(
	select siteid from tcontent where type='Module' and moduleID='00000000000000000000000000000000016'
)
</cfquery>

<cfif rsCheck.recordcount>
	<cfloop query="rsCheck">
		<cfquery>
		INSERT INTO tcontent
		(
			SiteID
			,ModuleID
			,ParentID
			,ContentID
			,ContentHistID
			,Type
			,subType
			,Active
			,Title
      ,Display
			,Approved
			,IsNav
			,forceSSL
		) VALUES  (
			<cfqueryparam cfsqltype="cf_sql_varchar" value="#rsCheck.siteid#">
			,'00000000000000000000000000000000016'
			,'00000000000000000000000000000000END'
			,'00000000000000000000000000000000016'
			,'#createUUID()#'
			,'Module'
			,'default'
			,1
			,'Mura ORM Scaffolding'
			,1
			,1
			,1
			,0
		)
		</cfquery>
	</cfloop>
</cfif>
