# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

    <!-- <%= render "layouts/header" %> -->

    <h2 >Log in</h2>
<%= form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>
  <div class="field">
    <%= f.label :email, style: "margin-right: 208px"%><br />
    <%= f.email_field :email, autofocus: true, autocomplete: "email" %>
  </div>
  
  <div class="field">
    <%= f.label :password, style: "margin-right: 181px" %><br />
    <%= f.password_field :password, autocomplete: "current-password" %>
  </div>

  <% if devise_mapping.rememberable? %>
    <div class="field">
      <%= f.check_box :remember_me %>
      <%= f.label :remember_me, style: "margin-right: 125px"%>
    </div>
  <% end %>

  <spam class="actions">
    <%= f.submit "Log in", style: "margin-right: 133px"%>
  </div>
<% end %>
  <%= render "devise/shared/links" %>

