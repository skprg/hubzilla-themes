<ul class="nav nav-tabs nav-fill clearfix">
	<li class="nav-item">
		<a class="nav-link active messages-type" href="#" title="{{$strings.messages_title}}" data-messages_type="">
			<i class="fa fa-fw fa-comment-o"></i>
		</a>
	</li>
	<li class="nav-item">
		<a class="nav-link messages-type" href="#" title="{{$strings.direct_messages_title}}" data-messages_type="direct">
			<i class="fa fa-fw fa-envelope-o"></i>
		</a>
	</li>
	{{if $feature_star}}
	<li class="nav-item">
		<a class="nav-link messages-type" href="#" title="{{$strings.starred_messages_title}}" data-messages_type="starred">
			<i class="fa fa-fw fa-star"></i>
		</a>
	</li>
	{{/if}}
	<li class="nav-item">
		<a class="nav-link messages-type" href="#" title="{{$strings.notice_messages_title}}" data-messages_type="notification">
			<i class="fa fa-fw fa-exclamation"></i>
		</a>
	</li>
</ul>
<div id="messages-widget" class="border-bottom overflow-auto mb-3 clearfix" style="height: 70vh;">
	<div id="messages-template" rel="template" class="d-none">
		<a href="{6}" class="list-group-item list-group-item-action message" data-b64mid="{0}">
			<div class="mb-2 align-middle">
				<img src="{9}" loading="lazy" class="rounded float-start me-2 menu-img-2">
				<div class="text-nowrap">
					<div class="d-flex justify-content-between align-items-center lh-sm">
						<div class="text-truncate">
							{7}
							<strong title="{4}">{4}</strong>
						</div>
						<small class="messages-timeago opacity-75" title="{1}"></small>
					</div>
					<div class="text-truncate">
						<small class="opacity-75" title="{5}">{5}</small>
					</div>
				</div>
			</div>
			<div class="mb-2">
				<div class="text-break">{2}</div>
			</div>
			<small class="opacity-75">{3}</small>
			{8}
		</a>
	</div>
	<div id="messages-container" class="list-group list-group-flush" data-offset="10">
		<div id="messages-author-container" class="list-group-item notifications-textinput">
			<div class="text-muted notifications-textinput-filter"><i class="fa fa-fw fa-filter"></i></div>
			<input id="messages-author" type="text" class="form-control form-control-sm" placeholder="{{$strings.filter}}">
			<div id="messages-author-input-clear" class="text-muted notifications-textinput-clear d-none"><i class="fa fa-times"></i></div>
		</div>
		{{foreach $entries as $e}}
		<a href="{{$e.href}}" class="list-group-item list-group-item-action message" data-b64mid="{{$e.b64mid}}">
			<div class="mb-2 align-middle">
				<img src="{{$e.author_img}}" loading="lazy" class="rounded float-start me-2 menu-img-2">
				<div class="text-nowrap">
					<div class="d-flex justify-content-between align-items-center lh-sm">
						<div class="text-truncate pe-1">
							{{$e.icon}}
							<strong title="{{$e.author_name}}">{{$e.author_name}}</strong>
						</div>
						<small class="messages-timeago opacity-75" title="{{$e.created}}"></small>
					</div>
					<div class="text-truncate">
						<small class="opacity-75" title="{{$e.author_addr}}">{{$e.author_addr}}</small>
					</div>
				</div>
			</div>
			<div class="mb-2">
				<div class="text-break">{{$e.summary}}</div>
			</div>
			<small class="opacity-75">{{$e.info}}</small>
			{{if $e.unseen_count}}
			<span class="badge bg-transparent border border-{{$e.unseen_class}} text-{{$e.unseen_class}} rounded-pill position-absolute bottom-0 end-0 m-2" title="{{$strings.unseen_count}}">{{$e.unseen_count}}</span>
			{{/if}}
		</a>
		{{/foreach}}
		<div id="messages-empty" class="list-group-item border-0"{{if $entries}} style="display: none;"{{/if}}>
			{{$strings.empty}}...
		</div>
		<div id="messages-loading" class="list-group-item" style="display: none;">
			{{$strings.loading}}<span class="jumping-dots"><span class="dot-1">.</span><span class="dot-2">.</span><span class="dot-3">.</span></span>
		</div>
	</div>
</div>
<script>
	let messages_offset = {{$offset}};
	let get_messages_page_active = false;
	let messages_type;
	let author_hash;
	let author_url;
	let author;

	$(document).ready(function () {
		$('.messages-timeago').timeago();
		if (bParam_mid) {
			$('.message[data-b64mid=\'' + bParam_mid + '\']').addClass('active');
		}

		$("#messages-author").name_autocomplete(baseurl + '/acl', 'a', false, function(data) {
			// a workaround to not re-trigger autocomplete after initial click
			$("#messages-author").val('').attr('placeholder', data.name);
			$('#textcomplete-dropdown').hide();

			$('#messages-container .message').remove();
			$('#messages-author-container').addClass('active sticky-top');
			$('#messages-author-input-clear').removeClass('d-none');
			author_hash = data.xid;
			author_url = data.url;
			author = messages_type === 'notification' ? author_url : author_hash;
			messages_offset = 0;
			get_messages_page();
		});

		$(document).on('click', '#messages-author-input-clear', function() {
			$('#messages-author').val('');
			$("#messages-author").attr('placeholder', '{{$strings.filter}}');

			$('#messages-author-container').removeClass('active sticky-top');
			$('#messages-author-input-clear').addClass('d-none');
			$('#messages-container .message').remove();
			author = '';
			author_hash = '';
			author_url = '';
			messages_offset = 0;
			get_messages_page();
		});

	});

	$('#messages-widget').on('scroll', function() {
		if(this.scrollTop > this.scrollHeight - this.clientHeight - (this.scrollHeight/7)) {
			get_messages_page();
		}
	});

	$(document).on('click', '.messages-type', function(e) {
		e.preventDefault();
		$('.messages-type').removeClass('active');
		$(this).addClass('active');
		messages_offset = 0;
		messages_type = $(this).data('messages_type');
		author = messages_type === 'notification' ? author_url : author_hash;
		$('#messages-container .message').remove();
		get_messages_page();
	});

	function get_messages_page() {

		if (get_messages_page_active)
			return;

		if (messages_offset === -1)
			return;

		get_messages_page_active = true;
		$('#messages-loading').show();
		$('#messages-empty').hide();

		$.ajax({
			type: 'post',
			url: 'hq',
			data: {
				offset: messages_offset,
				type: messages_type,
				author: author
			}
		}).done(function(obj) {
			get_messages_page_active = false;
			messages_offset = obj.offset;
			let html;
			let tpl = $('#messages-template[rel=template]').html();
			if (obj.entries.length) {
				obj.entries.forEach(function(e) {
					html = tpl.format(
						e.b64mid,
						e.created,
						e.summary,
						e.info,
						e.author_name,
						e.author_addr,
						e.href,
						e.icon,
						e.unseen_count ? '<span class="badge bg-transparent border border-' + e.unseen_class + ' text-' + e.unseen_class + ' rounded-pill position-absolute bottom-0 end-0 m-2" title="{{$strings.unseen_count}}">' + e.unseen_count + '</span>' : '',
						e.author_img
					);
					$('#messages-loading').before(html);
				});
			}
			else {
				$('#messages-empty').show();
			}
			if (bParam_mid) {
				$('.message[data-b64mid=\'' + bParam_mid + '\']').addClass('active');
			}
			$('#messages-loading').hide();
			$('.messages-timeago').timeago();

		});

	}
</script>
