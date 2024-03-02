<!-- pinned apps in main sidebar menu -->
    <a href="{{$app.url}}" class="dropdown-item {{if $app.active}} active{{/if}}">
 	{{if $icon}}
	<i class="fa fa-fw fa-{{$icon}}"></i> {{$app.name}}
	{{/if}}
    </a>
