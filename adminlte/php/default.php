<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?php if(x($page,'title')) echo $page['title'] ?></title>
  <?php if(x($page,'htmlhead')) echo $page['htmlhead'] ?>
</head>
<body class="dark-mode layout-navbar-fixed layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__wobble" src="https://hub.utsukta.org/photo/ec268a46-11ab-427f-a605-a54cb341a637-1.png" alt="Utsukta Hub" height="60" width="60">
  </div>

  <?php if(x($page,'nav')) echo $page['nav']; ?>

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-0">
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
      <?php if(x($page,'aside')) echo $page['aside']; ?>
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



   <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper px-2 py-2">
      <?php if(x($page,'content')) echo $page['content']; ?>
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
      <?php if(x($page,'aside')) echo $page['aside']; ?>
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  <footer class="main-footer text-sm">
    🖖 Live long and prosper.
    <div class="float-right d-none d-sm-inline-block">
    </div>
  </footer>
</div>
<!-- ./wrapper -->

</body>
</html>

