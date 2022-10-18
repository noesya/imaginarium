SimpleNavigation::Configuration.run do |navigation|
  navigation.renderer = ::Appstack::SimpleNavigationRenderer
  navigation.auto_highlight = true
  navigation.highlight_on_subpath = true
  navigation.selected_class = 'active'
  navigation.items do |primary|
    primary.item :dashboard, 'Tableau de bord', admin_root_path,  { highlights_on: /admin$/ }
    primary.item :spaces, 'Espaces', admin_spaces_path
    primary.item :images, 'Images', admin_images_path
    primary.item :users, 'Utilisateurs', admin_users_path
    primary.item :questions, 'Questions', admin_questions_path
  end
end