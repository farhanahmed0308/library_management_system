module ApplicationHelper
    def user_profile_link(user)
        return unless user.present? && user.profile_picture.attached?
        link_path = user.has_role?('member') ? '/memberprofiles' : '/adminprofiles'
        link_to link_path do
            image_tag url_for(user.profile_picture), class: 'rounded-circle', height: 25, alt: 'Black and White Portrait of a Man', loading: 'lazy'
        end
    end
    def user_profile_details(user)
        return unless user.present? && user.profile_picture.attached?
        link_path = user.has_role?('member') ? '/memberprofiles' : '/adminprofiles'
        link_to link_path do
            image_tag url_for(user.profile_picture), height: 288, alt: 'Black and White Portrait of a Man', loading: 'lazy'
        end
    end
end
