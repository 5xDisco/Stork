module DirectmsgHelper
  def directmsg_exist(current_user, user, space)
    channel = Channel.direct_message_for_users([current_user, user], space.id)
    classes = ['ml-3', 'text-white', 'text-xs', 'w-4', 'h-4', 'bg-red-600', 'rounded-full', 'text-center']
    if channel
      classes << (channel.has_unread_message?(current_user, space) ? 'visible' : 'invisible')
    end  
    tag.div "#{channel.unread_message_count(user)}", class: classes, "data-controller": "unreads", "data-unreads-channelId": "#{channel.id}", "data-unreads-userId": "#{current_user.id}"
  end
end