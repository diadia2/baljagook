/* Tripline Site JS */

if (typeof Tripline == 'undefined') {
    var Tripline = {};
}
Tripline.namespace = function() {
    var a=arguments, o=null, i, j, d;
    for (i=0; i<a.length; i=i+1) {
        d=(""+a[i]).split(".");
        o=Tripline;
        for (j=(d[0] == "Tripline") ? 1 : 0; j<d.length; j=j+1) {
            o[d[j]]=o[d[j]] || {};
            o=o[d[j]];
        }
    }
    return o;
};

/*UTILITY FUNCTIONS*/
String.prototype.trim = function () {
    return this.replace(/^\s+|\s+$/g, "");
};

String.prototype.noQuotes = function () {
    return this.replace(/"/g, '');
};

String.prototype.noEmoji = function () {
    return this.replace(/([\uE000-\uF8FF]|\uD83C[\uDF00-\uDFFF]|\uD83D[\uDC00-\uDDFF])/g, '');
};

String.prototype.encode = function () {
    return encodeURIComponent(this.trim().noEmoji()); 
};

String.prototype.safe = function () {
    return this.noEmoji(); 
};

String.prototype.nl2br = function () {
    return this.replace(/\n/g, "<br />");
};

String.prototype.br2nl = function () {
    return this.replace(/<br\s*\/?>/mg,"\n");
};

String.prototype.addslashes = function () {
    return this.replace(/\\/g, '\\\\').
        replace(/\u0008/g, '\\b').
        replace(/\t/g, '\\t').
        replace(/\n/g, '\\n').
        replace(/\f/g, '\\f').
        replace(/\r/g, '\\r').
        replace(/'/g, '\\\'').
        replace(/"/g, '\\"');
};


/* 3rd PARTY LOGINS*/

Tripline.connectFacebook = function(done) {
	if (!done) {done='';}
	FB.login(function(response) {
			if (response) {
				if (response.authResponse) {
					url = '/fbconnect.php?done=' + done;
                	document.location = url;
				} else {
					return;
				}
			} else {
				alert('Unable to contact Facebook');
				return;
			}
		},
		{scope:'email, user_friends, user_location, user_photos, user_posts, publish_actions'}
	);
};

/* Utility functions */

Tripline.namespace('Util');

Tripline.Util.alert = function(message) {
	if (!message) {message = 'There was an error processing your request. Please try again.'}
	$('#page-alert-text').html(message);
	$('#page-alert').removeClass('hidden');
	$('#page-success').addClass('hidden');
};

Tripline.Util.success = function(message) {
	if (!message) {message = 'Success!'}
	$('#page-success-text').html(message);
	$('#page-success').removeClass('hidden');
	$('#page-alert').addClass('hidden');
};

Tripline.Util.confirm = function(props) {
	//modal template in base.tpl
	if (props.title) {
		$('#tl-confirm-title').html(props.title);
	}
	if (props.text) {
		$('#tl-confirm-text').html(props.text);
	}
	if (props.cancel) {
		$('#tl-confirm-cancel').html(props.cancel);
	}
	if (props.proceed) {
		$('#tl-confirm-proceed').html(props.proceed);
	}
	$('#tl-confirm-proceed').attr('onclick', props.action + ';Tripline.Util.closeConfirm()');
	$('#tl-confirm-modal').modal();
};

Tripline.Util.closeConfirm = function() {
	$('#tl-confirm-modal').modal('hide');
	$('#tl-confirm-title').html('Confirm');
	$('#tl-confirm-text').html('Are you sure?');
	$('#tl-confirm-cancel').html('Cancel');
	$('#tl-confirm-proceed').html('Ok');
	$('#tl-confirm-proceed').attr('onclick', '');
};

Tripline.Util.doPost = function( form, bn ) {
    document[form].button.value = bn;
    return true;
};

Tripline.Util.readImageUrl = function(input,displayEl) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			$(displayEl).attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
};

Tripline.Util.trimText = function(text, limit){

    if (!limit){ return text; }

    if (text.length > limit){
        return text.substr(0, limit - 3) + '...';
    }

    return text;
};

Tripline.Util.seoEncode = function (str) {
    //same as entity class
    str = str.replace(/ /g, '_').replace(/-/g, '_').replace(/\?/g,'').replace(/&/g,'').replace(/#/g,'').replace(/,/g,'').replace(/'/g,'');
    var encoded = encodeURIComponent(str);
    // now unencdoe the / %2f
    str = str.replace('%2F', '/');
	return str; 
};

Tripline.Util.linkify = function(str, options){
	if (!str) return '';
    if(!options) options = {};
    if(!options.limit) options.limit = 32;
    if(!options.tagFill) options.tagFill = '';
    
    var linkRegex = /((http\:\/\/|https\:\/\/)|(www\.))+(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/gi;
    
    str = str.replace(linkRegex, function(value){
    	
    	//removing lowercase since it breaks trip ids
        //value = value.toLowerCase();
        
        var m = value.match(/^([a-z]+:\/\/)/);
        var nice;
        var url;
        
        if(m)
        {
            nice = value.replace(m[1],'');
            url = value;
        }
        else
        {
            nice = value;
            url = 'http://' + nice;
        }
        
        if (url.indexOf('www.tripline.net/map?tripId=') > 1) {  //bypass embedded tripline players
        	return url;
        } else {
        	return '<a class="external" href="' + url + '"' + (options.tagFill != '' ? (' ' + options.tagFill) : '')+ ' target="_blank" rel="nofollow" >' + Tripline.Util.trimText(nice, options.limit) + '</a>';
        }
    });
    
    return str;
};

Tripline.Util.vidify = function(str, options) {
	if (!str) return '';
	//youtube
	str = str.replace(/(?:http|https?:\/\/)?(?:www\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=)?([\w\-]{10,12})(?:&feature=related)?(?:[\w\-]{0})?/g, '<div class="rec" style="z-index:0;"><iframe src="//youtube.com/embed/$1" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></div>');
	
	//vimeo
	str = str.replace(/(?:http|https?:\/\/)?(?:www\.)?(?:vimeo\.com)\/?(.+)/g, '<div class="rec" style="z-index:0;"><iframe src="//player.vimeo.com/video/$1?badge=0" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></div>');
	
	//tripline
	Tripline.prod_base = 'https://www.tripline.net';
	str = str.replace(/(?:http|https?:\/\/)?(?:www\.)?(?:tripline\.net)\/trip\/[^-]*\-?([a-zA-Z0-9]{32})/g, '<div class="rec" style="z-index:0;"><iframe src="' + Tripline.prod_base + '/map?tripId=$1" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></div>');
	  
	return str;
}

Tripline.Util.br2nl = function(str) {
    return str.replace(/<br\s*\/?>/mg,"\n");
}

Tripline.Util.nl2br = function(str, is_xhtml) {
    var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br />' : '<br>';    
    return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1'+ breakTag +'$2');
}

Tripline.Util.countText = function(inputId,displayId,max,trim) {
	var input = $('#' + inputId);
	var display = $('#' + displayId);
	if (input.val().length > max) {
			if (trim) {
				input.val(input.val().substring(0, max));
			} else {
				display.val(max - input.val().length);
				display.css('color','#FC0000');
			}
	} else {
		display.val(max - input.val().length);
		display.css('color','#444');
	}
}

Tripline.Util.isValidEmailAddress = function(emailAddress) {
    var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
    return pattern.test(emailAddress);
};

Tripline.Util.getScopeIcon = function (scope) {
	switch(scope) {
		case 'public':
			return '<i class="fa fa-globe"></i>';
			break;
		case 'friends':
			return '<i class="fa fa-users"></i>';
			break;
		case 'unlisted':
			return '<i class="fa fa-unlock"></i>';
		case 'private':
			return '<i class="fa fa-lock"></i>';
		default:
			return;
	}
}

/* Site search */

Tripline.namespace('Search');

Tripline.Search.service = new Bloodhound({
  	//datumTokenizer: Bloodhound.tokenizers.obj.whitespace('values'),
  	datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.display); },
  	queryTokenizer: Bloodhound.tokenizers.whitespace,
  	prefetch: null,
	limit: 10, 
  	remote: {
    	url: '/ws/wrap/api/v1/search?p=%QUERY.json', //&order=views:desc for popularity
    	wildcard: '%QUERY',
    	filter: function (response) {
			if (response.stat) {
				return $.map(response.content, function (result) {
					var icon,url;
					if (result.t_id) {
						return {
							type: 'map',
							id: result.t_id,
							icon:'<i class="fa fa-map-o"></i>&nbsp;&nbsp;',
							title: result.display,
							/*url: Tripline.site_base + '/trip?id=' + result.t_id,*/
							url: '/trip/'+ Tripline.Util.seoEncode(result.display) + '-' + result.t_id,
						}
					} else if (result.w_id) {
						return {
							type: 'waypoint',
							id: result.w_id,
							icon:'<i class="fa fa-map-marker"></i>&nbsp;&nbsp;',
							title: result.display,
							/*url: Tripline.site_base + '/waypoint?id=' + result.w_id,*/
							url: '/waypoint/'+ Tripline.Util.seoEncode(result.display) + '-' + result.w_id,
						}
					} else if (result.u_id) {
						return {
							type: 'user',
							id: result.u_id,
							icon:'<i class="fa fa-user"></i>&nbsp;&nbsp;',
							title: result.index.split('|')[1].trim() + ' (' + result.display + ')',
							/*url: Tripline.site_base + '/user?id=' + result.u_id,*/
							url: '/' + result.index.split('|')[1].trim(),
						}
					} else if (result.p_id) {
						return {
							type: 'profile',
							id: result.p_id,
							icon:'<i class="fa fa-hashtag"></i>&nbsp;&nbsp;',
							title: result.display,
							url: '/topic/' + result.display.replace(/ /g, '+'),
						}
					} else if (result.q_id) {
						return null;
					}
				});
			} else {
				return [{icon:'',title:'<span class="text-muted">No results</span>'}];
			}
		}
  	},
});

Tripline.Search.service.initialize();

_.compile = function (template) {
	var compiled = this.template(template);
	compiled.render = function (context) {
		return this(context);
	}
	return compiled;
}

//see on doc ready for additional search functions

/*Follows*/

Tripline.namespace('Follow');

Tripline.Follow.add = function (followType, followId) {
		
	var addFollow = $.ajax({
		type: 'POST',
		url: '/ws/wrap/api/v1/follow/?format=json',
		data: {
			u_id: Tripline.uid,
			follow_id: followId,
			type: followType,
		},
	});
	
	addFollow.done(function(response){
		try {
			if (response.stat) {
				location.reload(true);
			} else {
				Tripline.Util.alert(response.content);
			}
		} catch(x) {
			Tripline.Util.alert(x.message);
		}
	});
	
	addFollow.fail(function(response){
		Tripline.Util.alert(response.content);
	}); 
};

Tripline.Follow.remove = function (followType, followId) {
	
	var removeFollow = $.ajax({
		type: 'DELETE',
		url: '/ws/wrap/api/v1/follow/?format=json&u_id='+ Tripline.uid +'&follow_id=' + followId + '&type=' + followType,
	});
	
	removeFollow.done(function(response){
		try {
			if (response.stat) {
				location.reload(true);
			} else {
				throw (response.content);
			}
		} catch(x) {
			Tripline.Util.alert(x.message);
		}
	});
	
	removeFollow.fail(function(response){
		Tripline.Util.alert(response.content);
	});
};

/*Locations*/
Tripline.Location = Backbone.Model.extend({
	defaults: {
    	lat:'',
    	lng:'',
    	name:''  	
    }
});

/*Trips*/  

Tripline.Trip = Backbone.Model.extend({
	urlRoot: '/ws/wrap/api/v1/trip/',
	defaults: {
    	
  	},
    initialize: function(){

    },
	parse : function(response){
		if (response.stat) {
    		
			if (response.content.playback_style) {  //older maps may not have playback_style
    			this.set('playback_style', response.content.playback_style[0]);
    			delete response.content.playback_style;
			} else {
				this.set('playback_style', '');
			}
    		
    		if (response.content.waypoints) {
    			this.set('waypoints', new Tripline.WaypointList(response.content.waypoints, {parse:true}));
    			delete response.content.waypoints;this
    		}
    		/*
    		if (response.content.places) {  //kml response has places instead of waypoints...todo:  change to match
    			this.set('waypoints', new Tripline.WaypointList(response.content.places, {parse:true}));
    			delete response.content.places;
    		}*/
    		
    		this.set('main_location', new Tripline.Location(response.content.main_location));
    		delete response.content.main_location;
    		
    		this.set('owner', new Tripline.User(response.content.owner));
    		delete response.content.owner;
    		
    		this.set('travelers', new Tripline.UserList(response.content.travelers));
    		delete response.content.travelers;
    		//remove the owner from travelers for now
    		/*var trip = this;
    		_.each(trip.get('travelers').models, function(model) {
    			if (model) {
					if (model.get('u_id') == response.content.u_id) {
						trip.get('travelers').remove(model,{silent:true})
					}
				}
    		});*/
    		
    		this.set('followers', new Tripline.UserList(response.content.followers));
    		delete response.content.followers;
    		
    		this.set('invites', new Tripline.UserList(response.content.invites));
    		delete response.content.invites;
    		
    		return response.content;
		}
	},
	/*save: function (attributes, options) {
		//override to use the /kml endpoint, using extend to preserve passed options
        //var opts = _.extend({url: '/ws/wrap/api/v1/kml/' + this.id}, options || {});
        return Backbone.Model.prototype.save.call(this, options);
    },*/
	destroy: function (options) {
		//override to use the /trip endpoint, using extend to preserve passed options
        var opts = _.extend({url: '/ws/wrap/api/v1/trip/' + this.id}, options || {});
        return Backbone.Model.prototype.destroy.call(this, opts);
    },
    canEdit: function () {
    	if (this.get('access') == 'owner' || this.get('access') == 'traveler') {
    		return true;
    	} else {
    		return false;
    	}
	},
    setDates: function() {
    	var startDate = null;
		var endDate = null;
    	_.each(this.get('waypoints').models, function(wp, i) {
    		if (wp.get('w_date')) {
				if (!startDate) {
					startDate = wp.get('w_date');
					endDate = wp.get('w_date');
				} else {
					endDate = wp.get('w_date');
				}
			}
    	});
    	this.set('start_date', startDate);
    	this.set('end_date', endDate);
    },
    deleteWaypoint: function (w_id) {
    	var wp = this.get('waypoints').get(w_id);
		this.get('waypoints').remove(wp);
		this.setDates();
		var atts = {};
		atts['w_id'] = w_id;
		atts['trip_set_dates'] = 1;
		atts['trip_start_date'] = Tripline.myTrip.get('start_date');
		atts['trip_end_date'] = Tripline.myTrip.get('end_date');
		this.save(
			{},
			{
				type: 'POST',
				url: Tripline.site_base + '/ws/wrap/api/v1/kml/' +  this.get('t_id') + '/delete_waypoint?format=json',
				data: atts,
				processData: true,
				success: function (trip, response) {
					Tripline.myTripView.render();
					Tripline.myTrip.player.init();
				},
				error: function(trip, response) {
					Tripline.Util.alert(response.content);
				},
				
			}
		);
    },
    inviteUser : function(inviteSystem, id, type) {
    	var trip = this;
    	if (inviteSystem == 'tripline') {
    		var addInvite = $.ajax({
				type: 'POST',
				url: '/ws/wrap/api/v1/invite/?format=json',
				data: {
					t_id: this.get('t_id'),
					from_id: Tripline.uid,
					to_id: id,
					type: type,
				},
			});
    	} else if (inviteSystem == 'email') {
    		var addInvite = $.ajax({
				type: 'POST',
				url: '/ws/wrap/api/v1/invite/?format=json',
				data: {
					t_id: this.get('t_id'),
					from_id: Tripline.uid,
					email: id,
					type: type,
				},
			});
    	}
    	addInvite.done(function(response){
			try {
				if (response.stat) {
					var user =  new Tripline.User ({
						u_id: response.content.u_id,
						username: response.content.username,
						fullname: response.content.fullname,
						avatar: response.content.avatar,
						avatar_uri: response.content.avatar_uri,
						fb_id: response.content.fb_id,
						use_fb_photo: response.content.use_fb_photo,
						seourl: response.content.seourl,
						i_id: response.content.i_id, //invite id always returned
						email: response.content.email, //returned only for email invites
						tu_id: response.content.tu_id, //returned if added as traveler
						fw_id: response.content.fw_id, //returned if added as follower
						
					});
					user.id =  response.content.u_id;
					if (response.content.type == 'tripfollow') {
						if (response.content.fw_id) {
							trip.get('followers').add(user);
							$('#trip-follow-count').html(trip.get('followers').length);
							$('#trip-follow-title').removeClass('cloak');
							if (Tripline.myTripView) {Tripline.myTripView.inviteUserSuccess('Added & notified')};
						} else {
							trip.get('invites').add(user);
							$('#trip-invite-count').html(trip.get('invites').length);
							$('#trip-invite-title').removeClass('cloak');
							if (Tripline.myTripView) {Tripline.myTripView.inviteUserSuccess('Invitation sent')};
						}
					} else {
						if (response.content.tu_id) {
							trip.get('travelers').add(user);
							if (Tripline.myTripView) {Tripline.myTripView.inviteUserSuccess('Added & notified')};
						} else {
							trip.get('invites').add(user);
							$('#trip-invite-count').html(trip.get('invites').length);
							$('#trip-invite-title').removeClass('cloak');
							if (Tripline.myTripView) {Tripline.myTripView.inviteUserSuccess('Invitation sent')};
						}
					}
				} else {
					if (Tripline.myTripView) {Tripline.myTripView.inviteUserFail(response.content)};
				}
			} catch(x) {
				if (Tripline.myTripView) {Tripline.myTripView.inviteUserFail(x.message)};
			}
		});
    	
    	addInvite.fail(function(response){
			if (Tripline.myTripView) {Tripline.myTripView.inviteUserFail(response.content)};
		});

	},
	removeUser: function(u_id, fw_id, cid) {
		var trip = this;
		if (fw_id) {
			var removeFollow = $.ajax({
				type: 'DELETE',
				url: '/ws/wrap/api/v1/follow/' + fw_id + '?format=json',
			});
			removeFollow.done(function(response){
				try {
					if (response.stat) {
						var followers = trip.get('followers');
						var follower = followers.get(cid);
						followers.remove(follower);
						$('#trip-follow-count').html(trip.get('followers').length);
					} else {
						throw (response.content);
					}
				} catch(x) {
					Tripline.Util.alert(x.message);
				}
			});
			removeFollow.fail(function(response){
				Tripline.Util.alert(response.content);
			});
		} else {
			var removeTraveler = $.ajax({
				type: 'DELETE',
				url: '/ws/wrap/api/v1/tripuser/' + trip.get('t_id') + '/user?u_id=' + u_id +'&format=json',
			});
			removeTraveler.done(function(response){
				try {
					if (response.stat) {
						var travelers = trip.get('travelers');
						var traveler = travelers.get(cid);
						travelers.remove(traveler);
					} else {
						throw (response.content);
					}
				} catch(x) {
					Tripline.Util.alert(x.message);
				}
			});
			removeTraveler.fail(function(response){
				Tripline.Util.alert(response.content);
			});
		}
	},
	removeInvite: function(i_id, cid) {
		var trip = this;
		var removeInvite = $.ajax({
			type: 'DELETE',
			url: '/ws/wrap/api/v1/invite/' + i_id + '?format=json',
		});
		removeInvite.done(function(response){
			try {
				if (response.stat) {
					var invites = trip.get('invites');
					var invite = invites.get(cid);
					invites.remove(invite);
					$('#trip-invite-count').html(trip.get('invites').length);
				} else {
					throw (response.content);
				}
			} catch(x) {
				Tripline.Util.alert(x.message);
			}
		});
		removeInvite.fail(function(response){
			Tripline.Util.alert(response.content);
		});
	},
	getEmbedCode: function(type) {
		switch(type) {
			case 'link':
				return Tripline.site_base + this.get('seourl');
				break;
			case 'thumb':
				return '<div><a href="'+ Tripline.site_base + '/trip?id=' + this.get('t_id') + '" target="_blank"><img src="'+ this.get('thumb_uri') +'" style="border:1px solid #eee;"></a></div><div><a href="'+ Tripline.site_base + '/trip?id=' + this.get('t_id') + '" target="_blank">'+ this.get('title') +'</a> on <a href="'+ Tripline.site_base +'" target="_blank">Tripline</a></div>'
				break;
			case 'map':
				return '<iframe src="'+ Tripline.site_base + '/map?tripId=' + this.get('t_id') + '&onSite=0" width="512" height="288" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>'
				break;
			case 'mapr':
				return '<div style="position: relative;margin: 5px 0 5px 0;padding-bottom: 56.25%;height: 0;clear: both;"><iframe style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;border: 0;" src="'+ Tripline.site_base + '/map?tripId=' + this.get('t_id') + '&onSite=0" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></div>'
				break;
			case 'list':
				return '<iframe src="'+ Tripline.site_base + '/trip?id=' + this.get('t_id') + '&list=1" width="600" height="1000" frameborder="0"></iframe>'
				break;
			default:
				return;
		}
	},
});	

Tripline.TripList = Backbone.Collection.extend({
	url: '/ws/wrap/api/v1/trip',
	parse : function(response){
		if (response.stat) {
			//return _.values(response.content);
			return _.map(response.content, function(model, id) {
				model.id = id;
				return model;
			});
		}
	}
});

Tripline.TripListView = Backbone.View.extend({
	tagName: 'div',
	className: 'trip-list clearfix',
	
	render: function() {
		this.collection.each(function(trip){
			var tripListItemView = new Tripline.TripListItemView({model: trip});
			this.$el.append(tripListItemView.render().el);
		}, this)
		return this;
	}
});

Tripline.TripListItemView = Backbone.View.extend({
	tagName: 'div',
	className: 'trip-list-item col-xs-12 col-sm-6 col-md-4 col-lg-3',

	initialize : function() { 
    	this.template = _.template($('#trip-list-item-template').html());
	},

	render: function() {
        $(this.el).html( this.template({trip:this.model}) );
		return this;
	}

});

Tripline.TripView = Backbone.View.extend({
	tagName: 'div',
	className: 'trip',
	
	initialize : function() { 
    	this.template = _.template($('#trip-template').html());
	},
	
	render: function() {
	
		$(this.el).html( this.template({trip:this.model}) );
		
		//have to instantiate in render so the els exist
		this.travelerGridView = new Tripline.UserGridView({
    		collection: this.model.get('travelers'),
    		el: $('#travelers'),
    	});
    	this.travelerGridView.render();
    	
    	this.inviteGridView = new Tripline.UserGridView({
    		collection: this.model.get('invites'),
    		el: $('#invites'),
    	});
    	this.inviteGridView.render();
    	
    	this.followerGridView = new Tripline.UserGridView({
    		collection: this.model.get('followers'),
    		el: $('#followers'),
    	});
    	this.followerGridView.render();
		
		this.waypointListView = new Tripline.WaypointListView({
    		collection: this.model.get('waypoints'),
    		el: $('#waypoints'),
    	});
		this.waypointListView.render();
		
		Tripline.Comments.loadComments($('#comments .comment-list.top'));
		
		$('#add-user-dropdown').on('shown.bs.dropdown', function () {
		  	if (!Tripline.myTripView.userSearch) {
		  		//activate user search
				Tripline.myTripView.userSearch = new Bloodhound({
					datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.display); },
					queryTokenizer: Bloodhound.tokenizers.whitespace,
					prefetch: null,
					limit: 8, 
					remote: {
						url: '/ws/wrap/api/v1/search?p=%QUERY.json&filter=user&order=views:desc',
						wildcard: '%QUERY',
						filter: function (response) {
							if (response.stat) {
								return $.map(response.content, function (result) {
									var icon,url;
									if (result.t_id) {
										return null;
									} else if (result.w_id) {
										return null;
									} else if (result.u_id) {
										return {
											type: 'user',
											id: result.u_id,
											icon:'<i class="fa fa-user"></i>&nbsp;&nbsp;',
											title: result.index.split('|')[1].trim() + ' (' + result.display + ')',
											short_title: result.index.split('|')[1].trim(),
											/*url: Tripline.site_base + '/user?id=' + result.u_id,*/
											url: '/' + result.index.split('|')[1].trim(),
										}
									} else if (result.p_id) {
										return null;
									} else if (result.q_id) {
										return null;
									} else {								
										return null;
									}
								});
							} else {
								//return [{icon:'',title:'<span class="text-muted">No results</span>'}];
								return [{icon:'',title:''}];
							}
						}
					},
				});
				
				Tripline.myTripView.userSearch.initialize();

				$('#input-user-search').typeahead(null, {
					source: Tripline.myTripView.userSearch.ttAdapter(),
					displayKey: 'short_title',
					templates: {
						suggestion: _.compile('<%= icon %><%= title %>'),
					},
				});
				
				$('#input-user-search').on('keydown', function (event, result) {
					//clear any previously selected user id
					$('#input-user-search-id').val('');				
				});

				$('#input-user-search').on('typeahead:selected', function (event, result) {
					event.stopPropagation();
					if (result) {
						$('#input-user-search-id').val(result.id);				
					}
				});
			
				$('#btn-user-add').on('click', function (event, result) {
					event.stopPropagation();
					if ($('#input-user-search').val()) {
						if ($("input[name=add-user-type]:checked").val()) {
							if ($('#input-user-search-id').val()) {
								//existing user selected, create invite
								Tripline.myTrip.inviteUser('tripline',$('#input-user-search-id').val(),$("input[name=add-user-type]:checked").val());
							} else {
								//no user selected
								if (Tripline.Util.isValidEmailAddress($('#input-user-search').val())) {
									//valid email, create invite
									Tripline.myTrip.inviteUser('email',$('#input-user-search').val(),$("input[name=add-user-type]:checked").val());
								} else {
									Tripline.myTripView.inviteUserFail('Please select an existing user or enter a valid email address');
								}
							}
						} else {
							Tripline.myTripView.inviteUserFail('Please select an invitation type.');
						}
					}				
				});
			
				$('#add-user-dropdown').on('hidden.bs.dropdown', function () {
					$('#input-user-search').val('');
					$('#input-user-search-id').val('');
					$('#add-user-dropdown input:radio').prop("checked", false);
					$('#user-add-success').html('').addClass('hidden');
					$('#user-add-error').html('').addClass('hidden');
				});
			}
			
			$('#input-user-search').focus();	
		  
		});
		
		return this;
	},
	inviteUserSuccess: function(message) {
		$('#input-user-search').val('');
		$('#input-user-search-id').val('');
		$('#input-user-search').focus();
		$('#user-add-error').addClass('hidden');
		$('#user-add-success').html(message + '<a class="pull-right" href="#done">Done</a>').removeClass('hidden');
	},
	inviteUserFail: function (message) {
		$('#user-add-success').addClass('hidden');
		$('#user-add-error').html(message).removeClass('hidden');
	},
});

/*Modals*/
Tripline.ShareTripModalView = Backbone.View.extend({	

	initialize : function() { 
    	this.template = _.template($('#share-trip-modal-template').html());
	},
	
	render: function() {
		$(this.el).html( this.template({trip:this.model}) );
		$(this.el).modal();
		return this;
	},
});

/*Waypoints*/
Tripline.Waypoint = Backbone.Model.extend({
	urlRoot: '/ws/wrap/api/v1/waypoint',
	defaults: {
    	address: '',
		description: '',
		lat: '',
		lng: '',
		main_url: '',
		more_info_url: '',
		mstr_id: '',
		notes: '',
		passthru: 'N',
		phone: '',
		t_id: '',
		title: '',
		travel_dest: '',
		travel_mode: '',
		travel_path: '',
		type_id: '',
		w_date: '',
		w_id: '',
		w_time: '',
  	},
    initialize: function(){
		
    },
    parse : function(response){
    	/*if (response.assets) {
    		var assets = new Tripline.AssetList(response.assets, {parse:true});
    		this.set('assets', assets);
    		//todo: why not created as backbone collection?
    	}*/
    	return response;
    },
    getDateForInput: function() {
    	if (this.get('w_date')) {
			if (moment(this.get('w_date'), "YYYY-MM-DD", true).isValid()) {
				return moment(this.get('w_date'), "YYYY-MM-DD").format("MM/DD/YYYY"); 
			} else {
				return moment(this.get('w_date'), "MM/DD/YYYY").format("MM/DD/YYYY");
			}
    	}
    },
    getDateForDisplay: function() {
    	if (this.get('w_date')) {
			if (moment(this.get('w_date'), "YYYY-MM-DD", true).isValid()) {
				return moment(this.get('w_date'), "YYYY-MM-DD").format("ddd, MMM DD, YYYY"); 
			} else {
				return moment(this.get('w_date'), "MM/DD/YYYY").format("ddd, MMM DD, YYYY");
			}
		}
    },
    getTimeForDisplay: function() {
    	if (this.get('w_time')) {
			if (moment(this.get('w_time'), "hh:mm a", true).isValid()) {
				return moment(this.get('w_time'), "hh:mm a").format("h:mm a"); 
			} else {
				return moment(this.get('w_time'), "HH:mm:ss").format("h:mm a"); 
			}
		}
    },
});

Tripline.WaypointList = Backbone.Collection.extend({
	model: Tripline.Waypoint,
	initialize : function(models){
		_.each(models, function(wp) { 
    		wp.id = wp.w_id;
    		var assetList = new Tripline.AssetList(wp.assets,{parse:true});
    		assetList.w_id = wp.w_id; //easy access to wp_id when dealing with collection 
    		wp.assets = assetList;
		});
	}
	
});

Tripline.WaypointListView = Backbone.View.extend({
	tagName: 'ul',
	className: 'timeline',
	initialize: function() {
		//this.listenTo(this.collection,  'add remove reset', this.render);
	},
	render: function() {
		$(this.el).html('');
		var listView = this;
		var wpDate, currDate;
		_.each(this.collection.models, function(wp,i){
			wpDate = wp.getDateForDisplay();
			if (wpDate && wpDate != currDate) {
				currDate = wpDate;
			 	dateBlock = '<li class="date"><span class="date-text">'+  wp.getDateForDisplay() +'</span></li>';
			 	listView.$el.append(dateBlock);
			}
			var waypointView = new Tripline.WaypointView({model: wp});
			listView.$el.append(waypointView.render().el);
		});
		
		return this;
	}
});


Tripline.WaypointView = Backbone.View.extend({
	tagName: 'li',
	className: 'waypoint',
	
	initialize : function() { 
    	this.template = _.template($('#waypoint-template').html());
    	this.listenTo(this.model, 'change', this.render);
	},
	
	render: function() {
		$(this.el).html( this.template({wp:this.model}) );
		
		if ($('.notes.in').length) {
			$('.notes-open').addClass('hidden');
			$('.notes.hascontent').addClass('in');
		}
		
		$('.notes-open').on('click', function(){
			$('.notes-open').addClass('hidden');
			$('.notes.hascontent').addClass('in');
			_.each($('.notes-open'), function(el) {
				if ($(el).closest('.waypoint').height() < $(el).prev().height()) {
					$(el).closest('.waypoint').height($(el).prev().height());
				}
			})
			
		});
		
		$('.notes-close').on('click', function(){
			$('.notes').removeClass('in');
			$('.notes').closest('.waypoint').height('initial'); 
			$('.notes-open.hascontent').removeClass('hidden');
		});
		
		if (!this.assetGalleryView) {
			this.assetGalleryView = new Tripline.AssetGalleryView({
				collection: this.model.get('assets'),
				el: $(this.el).find('.asset-gallery'),
			});
		}
		
		this.assetGalleryView.render();
		
		Tripline.Comments.loadComments($(this.el).find('.comment-list.top'));
		
		return this;
	}
});


Tripline.WaypointModalView = Backbone.View.extend({	

	initialize : function() { 
    	this.template = _.template($('#waypoint-modal-template').html());
	},
	
	render: function() {
		$(this.el).html( this.template({wp:this.model}) );
		$('#datetimepicker-wp-date').datetimepicker({
			debug: false,
			allowInputToggle:true,
			keepOpen:false,
			useCurrent: false,
			format: 'MM/DD/YYYY',
			icons: {
				time: 'fa fa-clock-o',
				date: 'fa fa-calendar',
				up: 'fa fa-chevron-up',
				down: 'fa fa-chevron-down',
				previous: 'fa fa-chevron-left',
				next: 'fa fa-chevron-right',
				today: 'fa fa-calendar-check-o',
				clear: 'fa fa-trash-o',
				close: 'fa fa-close'
			}
		});
		$('#datetimepicker-wp-time').datetimepicker({
			debug: false,
			allowInputToggle: true,
			keepOpen:false,
			useCurrent: false,
			format: 'hh:mm a',
			icons: {
				time: 'fa fa-clock-o',
				date: 'fa fa-calendar',
				up: 'fa fa-chevron-up',
				down: 'fa fa-chevron-down',
				previous: 'fa fa-chevron-left',
				next: 'fa fa-chevron-right',
				today: 'fa fa-calendar-check-o',
				clear: 'fa fa-trash-o',
				close: 'fa fa-close'
			}
		});
		$(this.el).modal();
		return this;
	},
	saveWaypoint: function() {
		var form = $(this.el).find('form#form-wp');
		this.model.set({
			title : form.find('#input-wp-title').val(),
			w_date : form.find('#input-wp-date').val(),
			w_time : form.find('#input-wp-time').val(),
			description : form.find('#textarea-wp-desc').val(),
			notes : form.find('#textarea-wp-notes').val(),
			address : form.find('#input-wp-address').val(),
			phone : form.find('#input-wp-phone').val(),
			main_url : form.find('#input-wp-main-url').val(),	
		});
		//trip level dates
		Tripline.myTrip.setDates();
		
		var atts = {};
		atts['w_id'] = this.model.get('w_id');
		atts['name'] = this.model.get('title').safe().noQuotes().encode();
		atts['w_date'] = this.model.get('w_date');
		if (this.model.get('w_time')) {
			atts['w_time'] = moment(this.model.get('w_time'), "h:mm a").format("HH:mm:ss"); //pass 24 hour time to back end
		}
		atts['description'] = this.model.get('description').safe().encode();
		atts['notes'] = this.model.get('notes').safe().encode();
		atts['address'] = this.model.get('address').safe().encode();
		atts['phone'] = this.model.get('phone').safe().encode();
		atts['main_url'] = this.model.get('main_url').safe().encode();
		
		//trip level dates
		atts['trip_set_dates'] = 1;
		atts['trip_start_date'] = Tripline.myTrip.get('start_date');
		atts['trip_end_date'] = Tripline.myTrip.get('end_date');
			
		this.model.save(
			{},
			{
				type: 'POST',
				url: Tripline.site_base + '/ws/wrap/api/v1/kml/' + this.model.get('t_id') + '/waypoint?format=json',
				data: atts,
				processData: true,
				success: function (wp, response) {
					Tripline.myWaypointModal.close();
				},
				error: function(wp, response) {
					console.log('Tripline: Error Saving Waypoint');
					console.log(response.statusText);
					$('#dialog-alert-text').html(response.statusText + ' Please contact <a href="mailto:support@tripline.net?subject=Error saving waypoint&body=' + response.statusText + ' on ' + wp.get('id') + ' in ' + Tripline.site_base + Tripline.myTrip.get('seourl') + ' ">support@tripline.net</a>');
					$('#dialog-alert').removeClass('hidden');			
				}
			}
		);
	},
	close: function () {
		Tripline.myTripView.render();
		Tripline.myTrip.player.init();
		$(this.el).modal('hide');
	},
});

Tripline.CopyWaypointModalView = Backbone.View.extend({	

	initialize : function() { 
    	this.template = _.template($('#copy-waypoint-modal-template').html());
	},
	
	render: function() {
		$(this.el).html( this.template({wp:this.model}) );
		
		if (Tripline.myLiteList) {
			$('#copy-to-existing').append('<option value="-1">Select a map...</option>');
			_.each(Tripline.myLiteList.models, function(trip, idx){
				$('#copy-to-existing').append('<option value="'+ trip.get('t_id')+ '">'+ trip.get('title')+ '</option>')
			});
		} else {
			$.ajax({
				url: '/ws/wrap/api/v1/trip/litelist?format=json',
				type: 'GET',
				data: {
					u_id: Tripline.uid,
				},
				success: function(response){
					if(response.stat) {
						Tripline.myLiteList = new Tripline.TripList(response.content);
						$('#copy-existing-trip').append('<option value="-1">Select a map...</option>');
						_.each(Tripline.myLiteList.models, function(trip, idx){
							$('#copy-existing-trip').append('<option value="'+ trip.get('t_id')+ '">'+ trip.get('title')+ '</option>')
						});
					} else {
						$('#copy-existing-trip').append('<option value="-1">No existing maps</option>');
						$('a[href="#copy-new"]').trigger('click');
					}
				},
			});
		}
		
		$(this.el).modal();
		return this;
	},
	copyWaypoint: function() {
		if ($('#copy-existing').hasClass('active')) {			
			this.copyToExisting();
		} else {
			this.copyToNew();
		}
	},
	copyToExisting: function() {
		var dialog = this;
		var t_id = $('#copy-existing-trip').val()
		if (!t_id) return;
		
		var mstr_id = this.model.get('mstr_id');
		
		$.ajax({
			url: '/ws/wrap/api/v1/kml/' + t_id + '/copy_waypoint?format=json',
			type: 'POST',
			data: {
				mstr_id: mstr_id,
			},
			success: function(response){
				if (response.stat) {
					if (Tripline.myTrip) {
						//copied from trip page
						if (response.content['place'].id == Tripline.myTrip.get('t_id')) {
							//copied to this trip
							window.location.href = '/trip/' + Tripline.Util.seoEncode(response.content['place'].name) + '-' + response.content['place'].id;
						} else {
							//copied to different trip
							$(dialog.el).modal('hide');
							var url = '/trip/' + Tripline.Util.seoEncode(response.content['place'].name) + '-' + response.content['place'].id;
							var action = 'window.location.href = \''+ url + '\'';
				
							Tripline.Util.confirm({
								title: 'Copy Successful',
								text: 'Would you like to open the map page now?',
								cancel: 'No',
								proceed: 'Yes',
								action: action,
							});
						}
					} else {
						//copied from waypoint page
						$(dialog.el).modal('hide');
						var url = '/trip/' + Tripline.Util.seoEncode(response.content['place'].name) + '-' + response.content['place'].id;
						var action = 'window.location.href = \''+ url + '\'';
				
						Tripline.Util.confirm({
							title: 'Copy Successful',
							text: 'Would you like to open the map page now?',
							cancel: 'No',
							proceed: 'Yes',
							action: action,
						});
					}
				} else {
					$('#dialog-alert-text').html(response.content);
					$('#dialog-alert').removeClass('hidden');	
				}
			},
		});
		
	},
	copyToNew: function () {
		var dialog = this;
		var tripTitle = $('#copy-new-title').val()
		if (!tripTitle) return;
		var scope = $('#copy-new-scope').val()
		
		var mstr_id = this.model.get('mstr_id');
		var wpTitle = this.model.get('title');
		var point = this.model.get('lat') + ','+ this.model.get('lng');
		
		$.ajax({
			url: '/ws/wrap/api/v1/kml/?format=json',
			type: 'POST',
			data: {
				title: tripTitle,
				scope: scope,
				u_id: Tripline.uid,
				point_name: wpTitle,
				point: point,
				point_start: '1',
			},
			success: function(response){
				if (response.stat) {
					$(dialog.el).modal('hide');
					var url = '/trip/' + Tripline.Util.seoEncode(response.content['place'].name) + '-' + response.content['place'].id;
					var action = 'window.location.href = \''+ url + '\'';
			
					Tripline.Util.confirm({
						title: 'Copy Successful',
						text: 'Would you like to open the map page now?',
						cancel: 'No',
						proceed: 'Yes',
						action: action,
					});
				} else {
					$('#dialog-alert-text').html(response.content);
					$('#dialog-alert').removeClass('hidden');
				}
			},
		});
	}
});

/*Assets*/

Tripline.Asset = Backbone.Model.extend({
	urlRoot: '/ws/wrap/api/v1/waypoint_assets/',
	defaults: {
    	asset_id: '',
		external_id: '',
		full_url: '',
		ordr: '',
		small_url: '',
		square_url: '',
		thumb_url: '',
		title: '',
		type: '',
		w_id: '',
  	},
  	idAttribute: 'asset_id',
    initialize: function(){

    },
    parse : function(response){
		if (response.stat) {
			this.id = response.content.asset_id;
			return response.content;
		}
	},

});

Tripline.AssetList = Backbone.Collection.extend({
	model: Tripline.Asset,
	parse: function(assets) {
		return _.map(assets, function(obj) {
			model = new Tripline.Asset(obj);
			return model;
		});
    }
	
});

Tripline.AssetGalleryView = Backbone.View.extend({
	initialize : function() { 
    	this.listenTo(this.collection, 'add remove change', this.render);
	},
	render: function() {
		$(this.el).html('');
		var gallery = this;
		_.each(this.collection.models, function(asset) {
			var assetGalleryItemView = new Tripline.AssetGalleryItemView({model: asset});
			gallery.$el.append(assetGalleryItemView.render().el);
		});
		
		$(this.el).justifiedGallery({
			rowHeight: 150,
			maxRowHeight: 150,
			selector:	'> a, > div:not(.spinner, .dragging)',
			//lastRow: 'justify',
			sort: function(a,b){return ($(a).attr('data-order') - $(b).attr('data-order'));},
		});

		$(this.el).on('click', function (event) {
			event = event || window.event;
			var target = event.target || event.srcElement,
				link = target.src ? target.parentNode : target,
				options = {index: link, event: event,stretchImages: true,},
				links = this.getElementsByTagName('a');
			blueimp.Gallery(links, options);
		});
		
		//set up dropability
		this.$el.bind("dragover", _.bind(this._dragOverEvent, this));
		this.$el.bind("dragenter", _.bind(this._dragEnterEvent, this));
		this.$el.bind("dragleave", _.bind(this._dragLeaveEvent, this));
		this.$el.bind("drop", _.bind(this._dropEvent, this));
		this._draghoverClassAdded = false;
		
		return this;
	},
	_dragOverEvent: function (e) {
		if (e.originalEvent) e = e.originalEvent
		var data = this._getCurrentDragData(e)
		
		if (this.dragOver(data, e.dataTransfer, e) !== false) {
			if (e.preventDefault) e.preventDefault()
			e.dataTransfer.dropEffect = 'copy' // default
		}
	},

	_dragEnterEvent: function (e) {
		if (e.originalEvent) e = e.originalEvent
		if (e.preventDefault) e.preventDefault()
	},

	_dragLeaveEvent: function (e) {
		if (e.originalEvent) e = e.originalEvent
		var data = this._getCurrentDragData(e)
		this.dragLeave(data, e.dataTransfer, e)
	},

	_dropEvent: function (e) {
		if (e.originalEvent) e = e.originalEvent
		var data = this._getCurrentDragData(e)
		
		if (e.preventDefault) e.preventDefault()
		if (e.stopPropagation) e.stopPropagation() // stops the browser from redirecting

		if (this._draghoverClassAdded) this.$el.removeClass("draghover")

		this.drop(data, e.dataTransfer, e)
	},

	_getCurrentDragData: function (e) {
		var data = null
		if (window._backboneDragDropObject) data = window._backboneDragDropObject
		return data
	},

	dragOver: function (data, dataTransfer, e) { // optionally override me and set dataTransfer.dropEffect, return false if the data is not droppable
		this.$el.addClass("draghover")
		this._draghoverClassAdded = true
	},

	dragLeave: function (data, dataTransfer, e) { // optionally override me
		if (this._draghoverClassAdded) this.$el.removeClass("draghover")
	},

	drop: function (data, dataTransfer, e) {
		var asset = data.model;
		if (this.collection == asset.collection) {
			//do nothing	
		} else {
			asset.collection.remove(asset);
			this.collection.add(asset);
			
			var atts = {};
			atts['w_id'] = this.collection.w_id;
			atts['u_id'] = Tripline.uid;	
			asset.save(
				{},
				{
					type: 'POST',
					url: '/ws/wrap/api/v1/waypoint_assets/' + asset.get('asset_id') + '?format=json',
					data: atts,
					processData: true,
					success: function(model,response){
						//silent
					},
				}
			);				
		}
	} 
	
});

Tripline.AssetGalleryItemView = Backbone.View.extend({
	className: 'asset',
	initialize : function() { 
    	this.template = _.template($('#asset-gallery-item-template').html());
	},
	render: function() {		
        $(this.el).html( this.template({asset:this.model}) );
        //set up dragability
        $(this.el).attr("draggable", "true");
		$(this.el).bind("dragstart", _.bind(this._dragStartEvent, this));
		/*$(this.el).bind("dragover", _.bind(this._dragOverEvent, this));
		$(this.el).bind("dragleave", _.bind(this._dragLeaveEvent, this));
		$(this.el).bind("drop", _.bind(this._dropEvent, this));*/
		
		$(this.el).attr('data-order', this.model.get('ordr'));
		
		return this;
	},
	_dragStartEvent: function (e) {
		var data
		if (e.originalEvent) e = e.originalEvent
		e.dataTransfer.effectAllowed = 'copy' // default to copy
		data = this.dragStart(e.dataTransfer, e)
		window._backboneDragDropObject = null
		if (data !== undefined) {
			window._backboneDragDropObject = data // we cant bind an object directly because it has to be a string, json just won't do
		}
	},
	/*
	_dragOverEvent: function (e) {
		if (e.originalEvent) e = e.originalEvent
		var data = this._getCurrentDragData(e)
		
		if (this.dragOver(data, e.dataTransfer, e) !== false) {
			if (e.preventDefault) e.preventDefault()
			e.dataTransfer.dropEffect = 'copy' // default
		}
	},
	
	_getCurrentDragData: function (e) {
		var data = null
		if (window._backboneDragDropObject) data = window._backboneDragDropObject
		return data
	},
	
	_dragLeaveEvent: function (e) {
		if (e.originalEvent) e = e.originalEvent
		var data = this._getCurrentDragData(e)
		this.dragLeave(data, e.dataTransfer, e)
	},
	
	_dropEvent: function (e) {
		if (e.originalEvent) e = e.originalEvent
		var data = this._getCurrentDragData(e)
		data.$el.removeClass('dragging')
		
		if (e.preventDefault) e.preventDefault()
		if (e.stopPropagation) e.stopPropagation() // stops the browser from redirecting

		this.drop(data, e.dataTransfer, e)
	},
	*/
	dragStart: function (dataTransfer, e) {
		$(this.el).addClass('dragging');
		return this;
	},
	/*
	dragOver: function (data, dataTransfer, e) {
		if (!Tripline._spacerAdded) {
			$( '<div id="asset-spacer" class="spacer asset jg-entry"></div>' ).insertAfter( this.$el );
			Tripline._spacerAdded = true;
			
			$(this.el).parent().justifiedGallery({
				rowHeight: 150,
				maxRowHeight: 150,
				selector:	'> a, > div:not(.spinner, .dragging)',
			//lastRow: 'justify',
			});
		}
		//this.$el.addClass("draghover");
		//this._draghoverClassAdded = true
	},
	
	dragLeave: function (data, dataTransfer, e) { 
		//if (this._draghoverClassAdded) this.$el.removeClass("draghover")
		if (Tripline._spacerAdded) {
			$( '#asset-spacer' ).remove();
			Tripline._spacerAdded = false;
			
			$(this.el).parent().justifiedGallery({
				rowHeight: 150,
				maxRowHeight: 150,
				selector:	'> a, > div:not(.spinner, .dragging)',
				//lastRow: 'justify',
			});
		}
	},
	
	drop: function (data, dataTransfer, e) {
		if (Tripline._spacerAdded) {
			$( '#asset-spacer' ).remove();
			Tripline._spacerAdded = false;
			
			$(this.el).parent().justifiedGallery({
				rowHeight: 150,
				maxRowHeight: 150,
				//lastRow: 'justify',
			});
		}
	}
	*/
});

Tripline.AssetUploadModalView = Backbone.View.extend({	

	initialize : function() { 
    	this.template = _.template($('#asset-upload-modal-template').html());
	},
	
	render: function() {
		$(this.el).html( this.template({wp:this.model}) );
		this.initDropzone();
		Tripline.myFacebookAssets = [];
		Tripline.fbPagin = '';
		Tripline.myInstagramAssets = [];
		Tripline.igPagin = '';
		Tripline.myFlickrAssets = [];
		Tripline.flPagin = '';
		$(this.el).modal();
		return this;
	},
	initDropzone: function () {
		Tripline.myDropzone = new Dropzone('#assets-dropzone',{ 
			dictDefaultMessage: '<i class="fa fa-camera"></i>&nbsp;&nbsp;Browse photos...',
			acceptedFiles: 'image/*', 
			maxFilesize: 10, // MB
			parallelUploads: 100,
			autoProcessQueue: false,
			addRemoveLinks:true,
			dictRemoveFile: '<i class="fa fa-times"></i>',
			dictCancelUpload: '',
			url: '/api/v1/kml/' + this.model.get('w_id') + '/waypoint_assets?format=json&output=plain',
		});
		//set up temp array
		Tripline.myDropzone.assets = [];
		Tripline.myDropzone.on('addedfile', function(file) {
			$('#asset-modal-upload').removeAttr('disabled'); 
		});
		Tripline.myDropzone.on('reset', function() {
			$('#asset-modal-upload').attr('disabled','disabled'); 
		});
		Tripline.myDropzone.on('success', function(file,response) {
			Tripline.myDropzone.removeFile(file);
			var asset = new Tripline.Asset($.parseJSON(response).content, {parse:false});
			asset.id = asset.get('asset_id');
			//add to temp array
			Tripline.myDropzone.assets.push(asset);
		});
		Tripline.myDropzone.on('queuecomplete', function() {	
			Tripline.myAssetUploadModal.model.get('assets').add(Tripline.myDropzone.assets);
			Tripline.myAssetUploadModal.close();
		});
	},
	getFacebookAssets: function() {
		$('#fb-loadmore').html('<img src="' + Tripline.media_base + '/media/image/loading.gif">&nbsp;Loading...');
		FB.api('/me/photos', 'get', {type: 'uploaded',limit: 20,fields:'id,picture,images',after:Tripline.fbPagin}, function(response){
			if (response.data.length == 20) {
				$('#fb-loadmore').html('<i class="fa fa-refresh"></i>&nbsp;&nbsp;Load More');
			} else {
				$('#fb-loadmore').html('');
			}
			_.each(response.data, function(asset) {
				Tripline.myFacebookAssets.push(asset);
				var div = $('<div>');
				div.addClass('dz-preview dz-image-preview');
				div.attr('id', 'fb-asset-'+ asset.id);
				div.attr('onclick', 'Tripline.myAssetUploadModal.selectAsset("'+ asset.id +'", "fb")');
				div.html('<div class="dz-preview dz-image-preview"><div class="dz-image"><img data-dz-thumbnail="" src="'+ asset.picture +'"></div><a class="dz-remove hide"><i class="fa fa-check"></i></a></div>');
				$('#fb-dropzone').append(div);
			});
			if (response.paging) {
				Tripline.fbPagin = response.paging.cursors.after;
			}
		});
	},
	getInstagramAssets: function() {
		$('#ig-loadmore').html('<img src="' + Tripline.media_base + '/media/image/loading.gif">&nbsp;Loading...');
		$.ajax({
			url: '/api/v1/instagram/myphotos?pagin=' + Tripline.igPagin,
			type: 'GET',
			success: function(response){
				if (response.content.length == 20 || true) { //bypass, videos are removed causing incorrect counts
					$('#ig-loadmore').html('<i class="fa fa-refresh"></i>&nbsp;&nbsp;Load More');
				} else {
					$('#ig-loadmore').html('');
				}
				_.each(response.content, function(asset) {
					Tripline.myInstagramAssets.push(asset);
					var div = $('<div>');
					div.addClass('dz-preview dz-image-preview');
					div.attr('id', 'ig-asset-'+ asset.id);
					div.attr('onclick', 'Tripline.myAssetUploadModal.selectAsset("'+ asset.id +'", "ig")');
					div.html('<div class="dz-preview dz-image-preview"><div class="dz-image"><img data-dz-thumbnail="" src="'+ asset.thumb_url +'"></div><a class="dz-remove hide"><i class="fa fa-check"></i></a></div>');
					$('#ig-dropzone').append(div);
					Tripline.igPagin = 'max_id.' + asset.id
				});
			},
		});
	},
	getFlickrAssets: function(loadmore) {
		$('#fl-loadmore').html('<img src="' + Tripline.media_base + '/media/image/loading.gif">&nbsp;Loading...');
		if (!loadmore) {
			Tripline.myFlickrAssets = [];
			$('#fl-dropzone').html('');
			Tripline.flPagin = 1
		}
		$.ajax({
			url: '/api/v1/flickr/photos_search?page=' + Tripline.flPagin,
			type: 'GET',
			data: {
				username: $('#input-fl-user').val(),
				text: $('#input-fl-text').val()
			},
			success: function(response){
				if (response.content.length == 20) {
					$('#fl-loadmore').html('<i class="fa fa-refresh"></i>&nbsp;&nbsp;Load More');
				} else {
					$('#fl-loadmore').html('');
				}
				_.each(response.content, function(asset) {
					Tripline.myFlickrAssets.push(asset);
					var div = $('<div>');
					div.addClass('dz-preview dz-image-preview');
					div.attr('id', 'fl-asset-'+ asset.id);
					div.attr('onclick', 'Tripline.myAssetUploadModal.selectAsset("'+ asset.id +'", "fl")');
					div.html('<div class="dz-preview dz-image-preview"><div class="dz-image"><img data-dz-thumbnail="" src="'+ asset.thumb_url +'"></div><a class="dz-remove hide"><i class="fa fa-check"></i></a></div>');
					$('#fl-dropzone').append(div);
				});
				Tripline.flPagin ++;
			},
		});
	},
	selectAsset: function(id, source) {
		$('#asset-modal-upload').removeAttr('disabled');
		if (source == 'fb') {
			var myAssets = Tripline.myFacebookAssets; 
		} else if (source == 'ig') {
			var myAssets = Tripline.myInstagramAssets;  
		} else if (source == 'fl') {
			var myAssets = Tripline.myFlickrAssets; 
		} else {
			return;
		}
		var asset = _.findWhere(myAssets, {id: id});
		if (!asset.selected) {
			asset.selected = true;
			$('#'+ source + '-asset-' + id).find('.dz-remove').removeClass('hide');
		} else {
			asset.selected = false;
			$('#'+ source + '-asset-' + id).find('.dz-remove').addClass('hide');
			if (_.where(myAssets, {selected: true}).length == 0) {
				$('#asset-modal-upload').attr('disabled','disabled');
			}
		}
	}, 
	uploadAssets: function() {
		$('#asset-modal-upload').html('<img src="' + Tripline.media_base + '/media/image/loading-blue.gif">&nbsp;Uploading...');
		$('#asset-modal-upload').attr('disabled','disabled');
		$('#asset-modal-close').attr('disabled','disabled');
		if ($('#upload').hasClass('active')) {
			Tripline.myDropzone.processQueue();
		} else if ($('#facebook').hasClass('active')) {
			this.crossloadAssets('fb');
		} else if ($('#instagram').hasClass('active')) {
			this.crossloadAssets('ig');
		} else if ($('#flickr').hasClass('active')) {
			this.crossloadAssets('fl');
		}
	},
	crossloadAssets: function (source) {
		if (source == 'fb') {
			var selectedAssets = _.where(Tripline.myFacebookAssets, {selected: true});
		} else if (source == 'ig') {
			var selectedAssets = _.where(Tripline.myInstagramAssets, {selected: true});
		} else if (source == 'fl') {
			var selectedAssets = _.where(Tripline.myFlickrAssets, {selected: true});
		} else {
			return;
		}
		
		_.each(selectedAssets, function(newAsset) {
			Tripline.assetQueue = selectedAssets.length;			
			if (source == 'fb') {
				var assetObj = {
					id: newAsset.id,
					full_url: newAsset.images[0].source,
					small_url: newAsset.picture,
					square_url: newAsset.picture,
					thumb_url: newAsset.picture,
					title: '',
				};
				var assetStr = JSON.stringify(assetObj); 
			} else {
				var assetStr = JSON.stringify(newAsset);
			}
		
			var atts = {};
			atts['photo'] = assetStr;
			atts['source'] = source;
			
			var asset = new Tripline.Asset();
			asset.save(
				{},
				{
					type: 'POST',
					url: '/ws/wrap/api/v1/kml/' + Tripline.myAssetUploadModal.model.get('w_id') + '/waypoint_assets?format=json',
					data: atts,
					processData: true,
					success: function(model,response){
						Tripline.myAssetUploadModal.model.get('assets').add(model);
						Tripline.assetQueue = Tripline.assetQueue -1;
						if (!Tripline.assetQueue) {
							Tripline.myAssetUploadModal.close();
						}
					},
				}
			);			
		});
	},
	close: function () {
		Tripline.myDropzone.assets = [];
		Tripline.myFacebookAssets = [];
		Tripline.myInstagramAssets = [];
		Tripline.myFlickrAssets = [];
		
		Tripline.myTrip.player.init();
		//this.model.trigger('change', this.model);
		$(this.el).modal('hide');
	},
});

/*Users*/

Tripline.User = Backbone.Model.extend({
	defaults: {
    	
  	},
    initialize: function(){

    },
    getAvatar: function() {
		if ( this.get('fb_id') && this.get('use_fb_photo') ) {
        	return 'https://graph.facebook.com/' + this.get('fb_id') + '/picture?type=normal';
        }
        if( this.get('avatar_uri') ) {
            return Tripline.avatar_base + '/' + this.get('avatar_uri');
        }
        return Tripline.media_base + '/media/image/tripuser.png';
    }
});

Tripline.UserList = Backbone.Collection.extend({
	model: Tripline.User,
	url: '/ws/wrap/api/v1/user',
	parse : function(response){
		if (response.stat) {
			//return _.values(response.content);
			return _.map(response.content, function(model, id) {
				model.id = id;
				return model;
			});
		}
	}
});

Tripline.UserListView = Backbone.View.extend({
	tagName: 'div',
	className: 'user-list clearfix',
	
	render: function() {
		this.collection.each(function(user){
			var userListItemView = new Tripline.UserListItemView({model: user});
			this.$el.append(userListItemView.render().el);
		}, this)
		return this;
	}
});

Tripline.UserListItemView = Backbone.View.extend({
	tagName: 'div',
	className: 'user-list-item col-xs-12 col-sm-6 col-md-4 col-lg-3',

	initialize : function() { 
    	this.template = _.template($('#user-list-item-template').html());
	},

	render: function() {
        $(this.el).html( this.template({user:this.model}) );
		return this;
	}

});

Tripline.UserGridView = Backbone.View.extend({
	initialize : function() { 
    	this.listenTo(this.collection, 'add remove reset', this.render);
	},		
	render: function() {
		this.$el.empty();
		this.collection.each(function(user){
			var userGridItemView = new Tripline.UserGridItemView({model: user});
			this.$el.append(userGridItemView.render().el);
		}, this);
		$('[data-toggle=tooltip]').tooltip();
		return this;
	},
});

Tripline.UserGridItemView = Backbone.View.extend({
	tagName: 'div',
	className: 'grid-item',
	
	initialize : function() { 
    	this.template = _.template($('#user-grid-item-template').html());
	},

	render: function() {
        $(this.el).html( this.template({user:this.model}) );
		return this;
	}
});

/*Comments */

Tripline.Comment = Backbone.Model.extend({
	urlRoot: '/ws/wrap/api/v1/comment?',
	defaults: {
    	/*c_id: "5431502406701004AACD82E0B152812F",
		u_id: "C316ADAED4E211DEB8A28D2DB53A3471",
		t_id: "",
		w_id: "16477366561610039860B929107119EB",
		user_id: "",
		q_id: "",
		a_id: "",
		parent_id: "",
		text: "and another comment",
		ordr: 2,
		cr_dt: "2011-07-08 16:47:23",
		display_cr_dt: "52 months ago",
		avatar: "http://graph.facebook.com/502954128/picture?type=normal",
		seourl: "/byron",
		fullname: "Byron Dumbrill"*/

  	},
    initialize: function(){
    	
    },
	parse : function(response){
		if (response.content) {
			return response.content;
		} else {
			if (response.replies) {
				//format the replies so we can pass to CommentList constructor
				var replies = {};
				replies.stat = 1;
				replies.content = response.replies;
				
				//create the reply collection
				var targetType = 'parent_id';
				var targetId = response.c_id;
				Tripline.myCommentLists[targetId] = new Tripline.CommentList(replies, {parse:true});
				Tripline.myCommentLists[targetId].targetId = targetId;
				Tripline.myCommentLists[targetId].targetType = targetType;
				Tripline.myCommentLists[targetId].start = 0;
				this.set('replies', Tripline.myCommentLists[targetId]);
				
				//remove the original replies from the response
				delete response.replies;
			}   	
			return response;
		}
	},
	canDelete: function () {
		if (Tripline.myTrip) {
			if (Tripline.myTrip.get('access') == 'owner' || Tripline.myTrip.get('access') == 'traveler') {
				return true;
			} else if (this.get('u_id') == Tripline.uid) {
				return true;
			} else {
				return false;
			}
		} else if (Tripline.myUser) {
			if (Tripline.myUser.get('u_id') == Tripline.uid) {
				return true;
			} else if (this.get('u_id') == Tripline.uid) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
});

Tripline.CommentList = Backbone.Collection.extend({
	url: '/ws/wrap/api/v1/comment',
	model: Tripline.Comment,
	parse: function(response){
		if (response.stat) {
			return _.map(response.content, function(comment, id) {
				comment.id = id;
				return comment;
			});
		}
	},
	load: function(){
		this.gettingData = true;
		var dataArgs = {};
		dataArgs[this.targetType] = this.targetId;
		dataArgs['order'] = 'cr_dt:asc';
		dataArgs['start'] = this.start;
		dataArgs['num_items'] = 8;
		dataArgs['format'] = 'json';
		this.fetch({
			traditional: true,
			remove:false,
			data: dataArgs,
			success: function(c){
				c.gettingData = false;
				c.start = c.start + 8;
				var loadmore = false;
				if (c.length == 8) {
					var loadmore = true;
				}
				Tripline.myCommentListViews[c.targetId].render(loadmore);
			}
		});
	},
});

Tripline.CommentListView = Backbone.View.extend({
	tagName: 'ul',
	className: 'comment-list list-group clearfix',
	initialize : function() { 
    	this.template = _.template($('#comment-list-template').html());
    	this.listenTo(this.collection,  'add remove reset', this.render);
	},
	render: function(loadmore) {
		$('#comments-loadmore-' + this.collection.targetId).remove();
		$(this.el).html( this.template({list:this.collection}) );
		this.collection.each(function(comment){
			var commentListItemView = new Tripline.CommentListItemView({model: comment});
			this.$el.append(commentListItemView.render().el);
		}, this);
		if (loadmore === true) {
			var loadmoreLink = $('<a>');
			loadmoreLink.attr('id', 'comments-loadmore-' + this.collection.targetId);
			loadmoreLink.attr('href', '#loadmore');
			loadmoreLink.attr('onclick', 'Tripline.Comments.loadMore("'+this.collection.targetId+'")');
			loadmoreLink.addClass('loadmore');
			loadmoreLink.html('<i class="fa fa-refresh"></i>&nbsp;&nbsp;Load More');
			this.$el.append(loadmoreLink);
		};
		return this;
	},
});

Tripline.CommentListItemView = Backbone.View.extend({
	tagName: 'li',
	className: 'comment list-group-item small-picture',
	initialize : function() { 
    	this.template = _.template($('#comment-list-item-template').html());
	},
	render: function() {
        $(this.el).html( this.template({comment:this.model}) );
        if (this.model.get('replies')) {
			var replyListView = new Tripline.CommentListView({
				collection:this.model.get('replies'),
			});
			this.$el.append(replyListView.render().el);
		}
		if (!this.model.get('parent_id') && Tripline.uid) {
			var display = true;
			if (!this.model.get('replies')) {
				display = false;
			}
			this.createReplyBox(display);
		}
		return this;
	},
	createReplyBox: function (display) {
		var replyBox = ($('<textarea>'));
		replyBox.attr('rows',1);
		replyBox.attr('id','comment-text-' + this.model.get('id'));
		replyBox.attr('data-target-type','parent_id');
		replyBox.attr('data-target-id',this.model.get('id'));
		replyBox.attr('placeholder','Reply');
		var replyBoxOnKeyDown = 'if(event.keyCode == 13) {event.preventDefault();Tripline.Comments.addComment("parent_id","'+ this.model.get('id') +'");}';
		replyBox.attr('onkeydown', replyBoxOnKeyDown);
		replyBox.addClass('input-comment reply');
		if (!display) {
			replyBox.attr('style','display:none;');
		}
		this.$el.append(replyBox);
	}
});

Tripline.namespace('Comments');

Tripline.Comments.loadComments = function(list) {
	var targetType = $(list).attr('data-target-type');
	var targetId = $(list).attr('data-target-id');
	Tripline.myCommentLists[targetId] = new Tripline.CommentList();
	Tripline.myCommentLists[targetId].targetId = targetId;
	Tripline.myCommentLists[targetId].targetType = targetType;
	Tripline.myCommentLists[targetId].start = 0;

	Tripline.myCommentListViews[targetId] = new Tripline.CommentListView({
									collection: Tripline.myCommentLists[targetId], 
									el: $(list) 
								});
	Tripline.myCommentLists[targetId].collection.load();
};

Tripline.Comments.loadMore = function(targetId) {
	if (!Tripline.myCommentLists[targetId].gettingData) {
		$('#comments-loadmore-' + targetId).html('<img src="' + Tripline.media_base + '/media/image/loading.gif">&nbsp;Loading...');
		Tripline.myCommentLists[targetId].collection.load();
	} 
}

Tripline.Comments.addComment = function(targetType, targetId) {
	var text = $('#comment-text-' + targetId).val();
	if (!text || text == '') return;
	var atts = {};
	atts[targetType] = targetId;
	atts['u_id'] = Tripline.uid;
	atts['text'] = text.noEmoji().encode();
	if (targetType == 'parent_id') {
		//special case for replies, get target type from parent list
		atts['target_type'] = $('#comment-text-' + targetId).closest('.comment-list.top').attr('data-target-type');
	}
	var comment = new Tripline.Comment(atts);
	comment.save(
		{},
		{
			type: 'POST',
			url: '/ws/wrap/api/v1/comment?format=json',
			data: atts,
			processData: true,
			success: function(comment, response){
				if (response.stat) {
					$('#comment-input-' + targetId).hide();
					$('#comment-text-' + targetId).val('');
				
					comment.set('id', comment.get('c_id'));
					comment.set('display_cr_dt','Just now');
				
					if (!Tripline.myCommentLists[targetId]) {
						//no replies yet, create a collection and a view
						Tripline.myCommentLists[targetId] = new Tripline.CommentList();
						Tripline.myCommentLists[targetId].targetId = targetId;
						Tripline.myCommentLists[targetId].targetType = 'parent_id';
						Tripline.myCommentLists[targetId].start = 0;
						Tripline.myCommentLists[targetId].add(comment);
						Tripline.myCommentListViews[targetId] = new Tripline.CommentListView({
										collection: Tripline.myCommentLists[targetId],
									});
						$(Tripline.myCommentListViews[targetId].render().el).insertBefore($('#comment-text-' + comment.get('parent_id')));			
					} else { 
						//collection already exists
						if(Tripline.myCommentLists[targetId].collection) {  //TODO: some have collection others don't
							if (comment.get('parent_id') == '') {
								Tripline.myCommentLists[targetId].collection.unshift(comment); //add to the top
							} else {
								Tripline.myCommentLists[targetId].collection.add(comment);
							}
						} else {
							if (comment.get('parent_id') == '') {
								Tripline.myCommentLists[targetId].unshift(comment); //add to the top
							} else {
								Tripline.myCommentLists[targetId].add(comment);
							}
						}
					}
				} else {
					Tripline.Util.alert(response.content);
				}
			},
			error: function(comment, response){
				Tripline.Util.alert('There was an error saving your comment. Please try again.');
			}
		}
	);	
};

Tripline.Comments.deleteComment = function(commentId, targetId) {
	
 	if (Tripline.myCommentLists[targetId].collection) {
 		//TODO:  figure out why top level comments have collection att, replies don't
 		var comment = Tripline.myCommentLists[targetId].collection.get(commentId);
 	} else {
 		var comment = Tripline.myCommentLists[targetId].get(commentId);
 	}
	comment.destroy();	
}

Tripline.Comments.openReplyBox = function(commentId) {
	if ($('#comment-text-' + commentId).is(":visible")) {
		$('#comment-text-' + commentId).focus();
	} else {
		$('#comment-text-' + commentId).attr('style', 'display:block;');
		$('#comment-text-' + commentId).focus();
	}
}

/*Doc Ready Functions*/
$(document).ready(function() {
	
	//Search
	$('#input-site-search').typeahead(null, {
		source: Tripline.Search.service.ttAdapter(),
		displayKey: 'title',
		templates: {
			suggestion: _.compile('<%= icon %><%= title %>')
		},
	});

	$('#input-site-search').on('typeahead:selected', function (event, result) {
		event.stopPropagation();
		if (result) {
			$('#navbar-search-submit').html('<img src="' + Tripline.media_base + '/media/image/loading.gif" />');
			document.location = result.url;
		}
	});

	$('#input-site-search').keypress(function(e) {
		var code = e.keyCode || e.which;
		if (code == '13') {
			if ($('#input-site-search').val()) {
				$('#navbar-search-submit').html('<img src="' + Tripline.media_base + '/media/image/loading.gif" />');
				$(this).closest('form').submit();
			}
	   }
	});

	$('#navbar-search-submit').on('click', function(e) {
		if ($('#input-site-search').val()) {
			$('#navbar-search-submit').html('<img src="' + Tripline.media_base + '/media/image/loading.gif" />');
			$(this).closest('form').submit();
		}
	});
	
	$('#my-trips-header-toggle').on('show.bs.dropdown', function () {
		if (!Tripline.headerTripsLoaded) {
			$('#my-trips-header-list').html('<li><div style="padding: 3px 20px;"><img src="' + Tripline.media_base + '/media/image/loading.gif" />&nbsp;&nbsp;Loading...</div></li>');
			var getHeaderTripList = $.ajax({
				type: 'GET',
				url: '/ws/wrap/api/v1/trip/litelist?format=json'
			});
	
			getHeaderTripList.done(function(response){
				try {
					if (response.stat) {
						$('#my-trips-header-list').empty();
						if (response.content.length) {
							_.each(response.content, function(trip){
								var seoUrl = '/trip/' + Tripline.Util.seoEncode(trip.title) + '-' + trip.t_id;
								$('#my-trips-header-list').append('<li><a href="'+ seoUrl +'">'+ Tripline.Util.getScopeIcon(trip.scope) +'&nbsp;&nbsp;' + trip.title + '</a></li>');
							});
						} else {
							var seoUrl = '/trip/' + Tripline.Util.seoEncode(response.content.title) + '-' + response.content.t_id;
							$('#my-trips-header-list').append('<li><a href="'+ seoUrl +'">'+ Tripline.Util.getScopeIcon(response.content.scope) +'&nbsp;&nbsp;' + response.content.title + '</a></li>');
						}
						Tripline.headerTripsLoaded = true;
					} else {
						$('#my-trips-header-list').html('<li><div class="text-muted" style="padding: 3px 20px;">No maps</div></li><li><a href="/create"><i class="fa fa-edit"></i>&nbsp;&nbsp;Create a map</a></li>');
						Tripline.headerTripsLoaded = true;
					}
				} catch(x) {
					Tripline.Util.alert(x.message);
				}
			});
	
			getHeaderTripList.fail(function(response){
				Tripline.Util.alert(response.content);
			});
		}
	});

	//Set up comments
	Tripline.myCommentLists = Array;
	Tripline.myCommentListViews = Array;

});