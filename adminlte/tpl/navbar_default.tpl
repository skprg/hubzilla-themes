 <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-dark">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="" role="button"><i class="fa fa-bars"></i></a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
          <i class="fa fa-search"></i>
        </a>
        <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fa fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fa fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </li>
      {{if $userinfo}}
      {{if $sel.name}}
      {{if $settings_url}}
      <li class="nav-item">
        <a id="nav-app-settings-link" href="{{$settings_url}}/?f=&rpath={{$url}}" class="nav-link pe-0 ps-0">
        <i class="fa fa-fw fa-cog"></i>
        </a>
      </li>
      {{/if}}
      {{/if}}

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-primary-emphasis" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">{{$userinfo.name}}</a>
        <ul class="dropdown-menu dropdown-menu-right">
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
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fa fa-ellipsis-v"></i>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>        
      </li>      
    </ul>
    {{if $nav.login && !$userinfo}}
      <div class="hstack gap-1 pt-1 pb-1 pr-2">
      {{if $nav.loginmenu.1.4}}
        <a class="btn btn-info btn-sm" href="#" title="{{$nav.loginmenu.1.3}}" data-bs-toggle="modal" data-bs-target="#nav-login">{{$nav.loginmenu.1.1}}</a>
      {{else}}
        <a class="btn btn-primary btn-sm" href="login" title="{{$nav.loginmenu.1.3}}">{{$nav.loginmenu.1.1}}</a>
      {{/if}}
      {{if $nav.register}}
        <a class="btn btn-warning btn-sm" href="{{$nav.register.0}}" title="{{$nav.register.3}}">{{$nav.register.1}}</a>
      {{/if}}
      </div>
    {{/if}}

  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-2">
    <!-- Brand Logo -->
    <a href="https://hub.utsukta.org" class="brand-link">
      <img src="https://hub.utsukta.org/photo/ec268a46-11ab-427f-a605-a54cb341a637-1.png" alt="Utsukta Hub" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">Utsukta Hub</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- SidebarSearch Form -->
      <div class="form-inline mt-3">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fa fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          
          <!-- Pinned apps for user -->
          {{if $navbar_apps.0}}
          {{foreach $navbar_apps as $navbar_app}}
          <li class="nav-item">
                {{$navbar_app}}
          </li>
          {{/foreach}}
          {{/if}}

          <!-- Other apps for user -->
          {{if $channel_apps.0}}
          <li class="nav-item">
            <a href="#" class="nav-link">
            <i class="nav-icon fa fa-dot-circle-o" aria-hidden="true"></i>
            <p>{{$channelapps}}<i class="fa fa-angle-left right"></i></p>
            </a>
            <ul class="nav nav-treeview" style="display: none;">
              {{foreach $channel_apps as $channel_app}}
                {{$channel_app}}
              {{/foreach}}
            </ul>
          </li>          
          {{/if}}

          <!-- Apps for owner -->
          {{if $is_owner}}
          <li class="nav-item">
            <a href="#" class="nav-link">
            <i class="nav-icon fa fa-dot-circle-o" aria-hidden="true"></i>
            <p>{{$featured_apps}}<i class="fa fa-angle-left right"></i></p>
            </a>
            <ul class="nav nav-treeview" style="display: none;">
              {{foreach $nav_apps as $nav_app}}
                {{$nav_app}}
              {{/foreach}}  
              <li class="nav-item">
                <a class="nav-link" href="/apps"><i class="nav-icon fa fa-fw fa-plus"></i> 
                <p>{{$addapps}}</p>
                </a>
              </li>
            </ul>
          </li>      
          {{else}}
          <!-- Apps for visitor -->
          <li class="nav-item">
            <a href="#" class="nav-link">
            <i class="nav-icon fa fa-dot-circle-o" aria-hidden="true"></i>
            <p>{{$sysapps}}<i class="fa fa-angle-left right"></i></p>
            </a>
            <ul class="nav nav-treeview" style="display: none;">
              {{foreach $nav_apps as $nav_app}}
                {{$nav_app}}
              {{/foreach}}
            </ul>
          </li>      
          {{/if}}
          <li class="nav-item">
           <a href="/siteinfo" class="nav-link">
            <i class="nav-icon fa fa-info-circle"></i>
            <p>About</p>
           </a>
          </li> 
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>


