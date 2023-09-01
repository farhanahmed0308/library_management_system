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


                <!-- <%= image_tag href: "", class: "card-img-top", height: "250px" %> -->


changes in book.Index
<!-- <h1 style="display: flex; justify-content: center;">index</h1>
<table class="table table-striped table-dark">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">Title</th>
        <th scope="col">Author</th>
        <th scope="col">ISBN</th>
        <th scope="col">action</th>

      </tr>
    </thead>
    <tbody>
        #<% @books.each_with_index do |i, a|%>
      <tr>
        <th scope="row"><%= a + 1 %></th>
        <td><%= i.title%></td>
        <td><%= i.author%></td>
        <td><%= i.isbn%></td>
        <td><%= link_to "show", book_path(i)%></td>
        <% if current_user && current_user.has_role?('librarian') %>
        <td><%= link_to "edit", edit_book_path(i)%></td>
        <% end %>

      </tr>
        <% end %> 
    </tbody>
  </table>
<td><%=link_to "new", new_book_path, class: "btn btn-md btn-success"%></td>

</div> -->

------------------------------
changes in book.show
<h1>show file</h1>
<% if @book.pdf.attached? %>
  <!-- Display the PDF file -->
  <%= link_to 'View PDF', rails_blob_path(@book.pdf, disposition: 'inline'), target: '_blank' %>
<% else %>
  <!-- Display a message if no PDF is attached -->
  <p>No PDF file attached</p>
<% end %>
<p><strong>title: </strong><%= @book.title %></p>
<p><strong>author: </strong><%= @book.author %></p>
<p><strong>ISBN: </strong><%= @book.isbn %></p>
