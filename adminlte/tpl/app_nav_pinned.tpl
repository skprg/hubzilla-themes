<!-- pinned apps in main sidebar menu -->
<li class="nav-item">
  <a href="{{$app.url}}" class="nav-link {{if $app.active}} active{{/if}}">
  {{if $icon}}<i class="fa fa-fw fa-{{$icon}}"></i>{{/if}}
  <p>{{$app.name}}</p>
  </a>
</li>

