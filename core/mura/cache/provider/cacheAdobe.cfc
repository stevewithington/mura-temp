/*This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on
Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with
independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without
Mura CMS under the license of your choice, provided that you follow these specific guidelines:

Your custom code

• Must not alter any default objects in the Mura CMS database and
• May not alter the default display of the Mura CMS logo within Mura CMS and
• Must not alter any files in the following directories.

 /admin/
 /tasks/
 /config/
 /core/mura/
 /Application.cfc
 /index.cfm
 /MuraProxy.cfc

You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work
under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL
requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your
modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License
version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS.
*/
component extends="mura.cfobject" output="false" hint="This is used by advanced caching to interact with CFML service"{
	property name="cacheName"
		type="string"
		getter="true"
		setter="true"
		default="data"
		hint="The name of the cache.";

	public any function init(){
		variables.cacheName=arguments.siteID & "-" &arguments.name;

		if(!cacheRegionExists(variables.cacheName) ) {
			cacheRegionNew(variables.cacheName);
		}

		return this;
	}

	public any function get(key){
		return cacheGet(arguments.key,variables.cacheName);
	}

	public any function getAll(){
		return CacheGetAllIds(variables.cacheName);
	}

	public any function put(key,value,timespan=1,idleTime=1){

		if(arguments.timespan eq ""){
			arguments.timespan=1;
		}

		if(arguments.idleTime eq ""){
			arguments.idleTime=1;
		}

		cachePut(arguments.key,
			arguments.value,
			arguments.timespan,
			arguments.idleTime,
			variables.cacheName);
	}

	public any function has(key){
		return !isNull(cacheGet(key,variables.cacheName));
	}

	public any function purge(key){
		cacheRemove(arguments.key,false,variables.cacheName);
	}

	public any function purgeAll(){
		var cache=cacheGetSession(variables.cacheName, true);

		if(!isNull(cache)){
			cache.removeAll();
		}

	}

	public any function size(){
		return arrayLen(CacheGetAllIds(variables.cacheName));
	}
}
