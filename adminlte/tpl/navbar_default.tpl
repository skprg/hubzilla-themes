 <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-dark">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="" role="button"><i class="fa fa-bars"></i></a>
      </li>
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

<!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
<div class="p-3 control-sidebar-content" style=""><h5>Customize AdminLTE</h5><hr class="mb-2"><div class="mb-4"><input type="checkbox" value="1" class="mr-1"><span>Dark Mode</span></div><h6>Header Options</h6><div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>Fixed</span></div><div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>Dropdown Legacy Offset</span></div><div class="mb-4"><input type="checkbox" value="1" class="mr-1"><span>No border</span></div><h6>Sidebar Options</h6><div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>Collapsed</span></div><div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>Fixed</span></div><div class="mb-1"><input type="checkbox" value="1" checked="checked" class="mr-1"><span>Sidebar Mini</span></div><div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>Sidebar Mini MD</span></div><div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>Sidebar Mini XS</span></div><div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>Nav Flat Style</span></div><div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>Nav Legacy Style</span></div><div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>Nav Compact</span></div><div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>Nav Child Indent</span></div><div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>Nav Child Hide on Collapse</span></div><div class="mb-4"><input type="checkbox" value="1" class="mr-1"><span>Disable Hover/Focus Auto-Expand</span></div><h6>Footer Options</h6><div class="mb-4"><input type="checkbox" value="1" class="mr-1"><span>Fixed</span></div><h6>Small Text Options</h6><div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>Body</span></div><div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>Navbar</span></div><div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>Brand</span></div><div class="mb-1"><input type="checkbox" value="1" class="mr-1"><span>Sidebar Nav</span></div><div class="mb-4"><input type="checkbox" value="1" class="mr-1"><span>Footer</span></div><h6>Navbar Variants</h6><div class="d-flex"><select class="custom-select mb-3 text-light border-0 bg-white"><option class="bg-primary">Primary</option><option class="bg-secondary">Secondary</option><option class="bg-info">Info</option><option class="bg-success">Success</option><option class="bg-danger">Danger</option><option class="bg-indigo">Indigo</option><option class="bg-purple">Purple</option><option class="bg-pink">Pink</option><option class="bg-navy">Navy</option><option class="bg-lightblue">Lightblue</option><option class="bg-teal">Teal</option><option class="bg-cyan">Cyan</option><option class="bg-dark">Dark</option><option class="bg-gray-dark">Gray dark</option><option class="bg-gray">Gray</option><option class="bg-light">Light</option><option class="bg-warning">Warning</option><option class="bg-white">White</option><option class="bg-orange">Orange</option></select></div><h6>Accent Color Variants</h6><div class="d-flex"></div><select class="custom-select mb-3 border-0"><option>None Selected</option><option class="bg-primary">Primary</option><option class="bg-warning">Warning</option><option class="bg-info">Info</option><option class="bg-danger">Danger</option><option class="bg-success">Success</option><option class="bg-indigo">Indigo</option><option class="bg-lightblue">Lightblue</option><option class="bg-navy">Navy</option><option class="bg-purple">Purple</option><option class="bg-fuchsia">Fuchsia</option><option class="bg-pink">Pink</option><option class="bg-maroon">Maroon</option><option class="bg-orange">Orange</option><option class="bg-lime">Lime</option><option class="bg-teal">Teal</option><option class="bg-olive">Olive</option></select><h6>Dark Sidebar Variants</h6><div class="d-flex"></div><select class="custom-select mb-3 text-light border-0 bg-primary"><option>None Selected</option><option class="bg-primary">Primary</option><option class="bg-warning">Warning</option><option class="bg-info">Info</option><option class="bg-danger">Danger</option><option class="bg-success">Success</option><option class="bg-indigo">Indigo</option><option class="bg-lightblue">Lightblue</option><option class="bg-navy">Navy</option><option class="bg-purple">Purple</option><option class="bg-fuchsia">Fuchsia</option><option class="bg-pink">Pink</option><option class="bg-maroon">Maroon</option><option class="bg-orange">Orange</option><option class="bg-lime">Lime</option><option class="bg-teal">Teal</option><option class="bg-olive">Olive</option></select><h6>Light Sidebar Variants</h6><div class="d-flex"></div><select class="custom-select mb-3 border-0"><option>None Selected</option><option class="bg-primary">Primary</option><option class="bg-warning">Warning</option><option class="bg-info">Info</option><option class="bg-danger">Danger</option><option class="bg-success">Success</option><option class="bg-indigo">Indigo</option><option class="bg-lightblue">Lightblue</option><option class="bg-navy">Navy</option><option class="bg-purple">Purple</option><option class="bg-fuchsia">Fuchsia</option><option class="bg-pink">Pink</option><option class="bg-maroon">Maroon</option><option class="bg-orange">Orange</option><option class="bg-lime">Lime</option><option class="bg-teal">Teal</option><option class="bg-olive">Olive</option></select><h6>Brand Logo Variants</h6><div class="d-flex"></div><select class="custom-select mb-3 border-0"><option>None Selected</option><option class="bg-primary">Primary</option><option class="bg-secondary">Secondary</option><option class="bg-info">Info</option><option class="bg-success">Success</option><option class="bg-danger">Danger</option><option class="bg-indigo">Indigo</option><option class="bg-purple">Purple</option><option class="bg-pink">Pink</option><option class="bg-navy">Navy</option><option class="bg-lightblue">Lightblue</option><option class="bg-teal">Teal</option><option class="bg-cyan">Cyan</option><option class="bg-dark">Dark</option><option class="bg-gray-dark">Gray dark</option><option class="bg-gray">Gray</option><option class="bg-light">Light</option><option class="bg-warning">Warning</option><option class="bg-white">White</option><option class="bg-orange">Orange</option><a href="#">clear</a></select></div>
  </aside>
  <!-- /.control-sidebar -->

