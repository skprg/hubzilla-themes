<!-- pinned apps in main sidebar menu -->
    <a id="nav-app-link" href="{{$app.url}}" class="nav-link text-truncate{{if $app.active}} active{{/if}}" style="width: 100%">
 	{{if $icon}}
	<i class="fa fa-fw fa-{{$icon}}"></i><span class="d-md-none"> {{$app.name}}</span>
	{{/if}}
    </a>
