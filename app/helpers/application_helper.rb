module ApplicationHelper

    # for using in the navbar
    def user_profile_link(user, height: 25, width: nil, alt: 'Black and White Portrait of a Man', rounded: true)
        link_path = user&.has_role?('member') ? '/memberprofiles' : '/adminprofiles'
        link_to link_path do
            if user.present? && user.profile_picture.attached?
                image_tag url_for(user.profile_picture), class: rounded ? 'rounded-circle' : '', height: height, width: width, alt: 'Black and White Portrait of a Man', loading: 'lazy'
            else
                image_tag url_for("https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp"), class: rounded ? 'rounded-circle' : '', height: height, width: width, alt: 'Black and White Portrait of a Man', loading: 'lazy'
            end 
        end
    end
end
