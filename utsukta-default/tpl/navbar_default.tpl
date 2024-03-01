        <nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top p-1" aria-label="Offcanvas navbar large">
            <div class="container-fluid">
                
                <button class="btn btn-outline btn-primary" id="sidebarToggle" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-exchange" aria-hidden="true"></i></button>
                
                <div class="navbar-brand">{{$banner}}</div>
                
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar2" aria-controls="offcanvasNavbar2" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>

                <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasNavbar2" aria-labelledby="offcanvasNavbar2Label">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasNavbar2Label">Menu</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <ul class="navbar-nav me-auto">                           
                            {{if $navbar_apps.0}}
                        		{{foreach $navbar_apps as $navbar_app}}
                            <li class="nav-item">
                                	{{$navbar_app|replace:'fa':'generic-icons-nav fa'}}
                            </li>
                        		{{/foreach}}
                        	{{/if}}
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Apps</a>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                {{if $channel_apps.0}}
                                    <a class="dropdown-item disabled" aria-disabled="true">{{$channelapps}}</a>
                        		    {{foreach $channel_apps as $channel_app}}
                        		        {{$channel_app}}
                           			{{/foreach}}
                    		    {{/if}}

                                {{if $is_owner}}
                                    <a class="dropdown-item disabled" aria-disabled="true">{{$featured_apps}}</a>
                                    <ul class="nav nav-treeview">
                    	        		{{foreach $nav_apps as $nav_app}}
                                            {{$nav_app}}
                                        {{/foreach}}
                                    </ul>
                        			<a class="dropdown-item" href="/apps"><i class="fa fa-fw fa-plus"></i> {{$addapps}}</a>
                        		{{else}}
                        	    	<a class="dropdown-item disabled" aria-disabled="true">{{$sysapps}}</a>
                        			{{foreach $nav_apps as $nav_app}}
                        		        {{$nav_app}}
                        			{{/foreach}}
                        		{{/if}} 
                                </div>
                            </li>                                                    
                        </ul>    
                        <form class="d-flex" role="search">
                             <input class="form-control me-2" id="nav-search-text" type="search" value="" placeholder="{{$help}}" name="search" title="{{$nav.search.3}}" onclick="this.submit();" onblur="closeMenu('nav-search'); openMenu('nav-search-btn');"/>
                        </form>
                    </div>
                </div>
                        <ul class="navbar-nav">                           
                          {{if $nav.login && !$userinfo}}
                            <div class="hstack gap-1 pt-1 pb-1">
                            {{if $nav.loginmenu.1.4}}
                              <a class="btn btn-info btn-sm" href="#" title="{{$nav.loginmenu.1.3}}" data-bs-toggle="modal" data-bs-target="#nav-login">{{$nav.loginmenu.1.1}}</a>
                            {{else}}
                              <a class="btn btn-primary btn-sm" href="login" title="{{$nav.loginmenu.1.3}}">{{$nav.loginmenu.1.1}}</a>
                            {{/if}}
                            {{if $nav.register}}
                              <a class="btn btn-warning btn-sm" href="{{$nav.register.0}}" title="{{$nav.register.3}}">{{$nav.register.1}}</a>
                            {{/if}}
                            </div>
                            <div class="nav d-lg-flex w-100"></div>
                          {{/if}}

                            <div class="dropdown mb-0 me-2 bd-mode-toggle">
                              <button class="btn btn-primary btn-sm py-2 dropdown-toggle d-flex align-items-center" id="bd-theme" type="button" aria-expanded="false"  data-bs-toggle="dropdown" aria-label="Toggle theme (auto)">
                              <svg class="bi my-1 theme-icon-active" width="1em" height="1em"><use href="#circle-half"></use></svg>
                              <span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
                              </button>
                              <ul class="dropdown-menu shadow" aria-labelledby="bd-theme-text">
                                  <li><button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="light" aria-pressed="false">
                                  <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em"><use href="#sun-fill"></use></svg>Light
                                  <svg class="bi ms-auto d-none" width="1em" height="1em"><use href="#check2"></use></svg>
                                  </button>
                                  </li>
                                  <li>
                                  <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="dark" aria-pressed="false">
                                  <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em"><use href="#moon-stars-fill"></use></svg>Dark
                                  <svg class="bi ms-auto d-none" width="1em" height="1em"><use href="#check2"></use></svg>
                                  </button>
                                  </li>
                                  <li>
                                  <button type="button" class="dropdown-item d-flex align-items-center active" data-bs-theme-value="auto" aria-pressed="true">
                                  <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em"><use href="#circle-half"></use></svg>Auto
                                  <svg class="bi ms-auto d-none" width="1em" height="1em"><use href="#check2"></use></svg>
                                  </button>
                                  </li>
                              </ul>
                            </div>

                            {{if $userinfo}}
                            {{if $sel.name}}
                            <li class="nav-item">
                              <a id="nav-app-link" href="{{$url}}" class="nav-link text-truncate" style="width: 100%">
                              {{$sel.name}}
                            {{if $sitelocation}}
                                ({{$sitelocation}})
                            {{/if}}
                              </a>
                            </li>

                      	    {{if $settings_url}}
                              <li class="nav-item">
              		             	<a id="nav-app-settings-link" href="{{$settings_url}}/?f=&rpath={{$url}}" class="nav-link">
		    	          		        <i class="fa fa-fw fa-cog"></i>
        			                	</a>
                              </li>
                    	    	{{/if}}
                        		{{/if}}

                            <li class="nav-item dropdown">
                              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">{{$userinfo.name}} <img class="img-profile mh-32px rounded-circle" src="{{$userinfo.icon}}"></a>
                              <ul class="dropdown-menu dropdown-menu-end">
                                  {{if $is_owner}}
                                  {{foreach $nav.usermenu as $usermenu}}
                                  <li><a href="{{$usermenu.0}}" class="dropdown-item">{{$usermenu.1}}</a></li>
                                  {{/foreach}}

                                  {{if $nav.group}}
                                  <a href="{{$nav.group.0}}" class="dropdown-item">{{$nav.group.1}}</a>
                                  {{/if}}

                                  {{if $nav.manage}}
                                  <li> <a href="{{$nav.manage.0}}" class="dropdown-item">
                                  {{$nav.manage.1}}
                                  </a></li>
                                  <li><hr class="dropdown-divider"></li>
                                  {{/if}}

                                  {{if $nav.channels}}
                                  {{foreach $nav.channels as $chan}}
                                  <li><a href="manage/{{$chan.channel_id}}" class="dropdown-item">
                                    <i class="fa fa-circle{{if $localuser == $chan.channel_id}} text-success{{else}} invisible{{/if}}"></i> {{$chan.channel_name}}
                                  </a></li>
                                  {{/foreach}}
                                  <li><hr class="dropdown-divider"></li>
                                  {{/if}}

                                  {{if $nav.profiles}}
                                  <li><a href="{{$nav.profiles.0}}" class="dropdown-item">
                                  {{$nav.profiles.1}}
                                  </a></li>
                                  <li><hr class="dropdown-divider"></li>
                                  {{/if}}

                                  {{if $nav.settings}}
                                  <li><a href="{{$nav.settings.0}}" class="dropdown-item">
                                  {{$nav.settings.1}}
                                  </a></li>
                                  <li><hr class="dropdown-divider"></li>
                                  {{/if}}

                                  {{if $nav.admin}}
                                  <li><a href="{{$nav.admin.0}}" class="dropdown-item">
                                  {{$nav.admin.1}}
                                  </a></li>
                                  <li><hr class="dropdown-divider"></li>
                                  {{/if}}

                                  {{if $nav.logout}}
                                  <li><a href="{{$nav.logout.0}}" class="dropdown-item">
                                  {{$nav.logout.1}}
                                  </a></li>
                                  {{/if}}

                                  <li>
                                  {{/if}}
                                  {{if ! $is_owner}}
                                  <li><a class="dropdown-item" href="{{$nav.rusermenu.0}}" role="menuitem">{{$nav.rusermenu.1}}</a></li>
                    			        <li><a class="dropdown-item" href="{{$nav.rusermenu.2}}" role="menuitem">{{$nav.rusermenu.3}}</a></li>
                                  {{/if}}
                                  </li>

                              </ul>
                            </li>
                            {{/if}}
                        </ul>

             </div>
        </nav>            

