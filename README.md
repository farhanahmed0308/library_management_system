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



  <!-- <%# form_with(url: "/reserve/", method: :post,) do |form| %>
                    <%# form.hidden_field :id, value: book.id %>
                    <%# if book.status != "Available" %>
                    <button type="submit" class="btn btn-warning" id="book-now-button">reserve</button>
                    <%# end %>
                    <%# end %> -->


                    member profile view: 
                    <%= render "layouts/navbar2" %>
<div class="container" style="margin-top: 30px;">
    <div class="row" style="background-color: lightslategrey;margin-bottom: 20px; margin-top: 114px;">
        <div class="col-4">
            <div class="card" style="width: 18rem; margin: 40px">
                <!-- <img src="	https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" class="card-img-top" alt="..."> -->
                
                <%= user_profile_link(current_user,height: 288, width: "100%", rounded: false )%> 
                <!-- HELPER METHOD --> 
                <div class="card-body">
                  <h5 class="card-title"><%= current_user.username%></h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
                </div>
            </div>
        </div>
        <div class="col-8">
            <div>
                   <div class="row border border-dark bg-secondary" style="background-color: white; margin-top: 50px; width: 80%;height: 50px; align-items: center;">
                    <div class="col-3">Name</div>
                    <div class="col-9"><%= current_user.username%></div>
                   </div>
                   <div class="row border border-dark bg-secondary" style="background-color: white; width: 80%; height: 50px; align-items: center;">
                    <div class="col-3">E-mail</div>
                    <div class="col-9"><%= current_user.email%></div>
                   </div>
                   <div class="row border border-dark bg-secondary" style="background-color: white; width: 80%; height: 50px; align-items: center;">
                    <div class="col-3">Phone</div>
                    <div class="col-9">(+92) 0000000000</div>
                   </div>
                   <div class="row border border-dark bg-secondary" style="background-color: white; width: 80%; height: 50px; align-items: center;">
                    <div class="col-3">Address</div>
                    <div class="col-9">local in Pakistan</div>
                   </div>   
            </div>
            <div style="display: flex; justify-content: center; margin-right: 149px;">
                <div class="card" style="width: 18rem; margin: 40px">
                    <!-- <img src="	https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" class="card-img-top" alt="..."> -->
                    <h3 style="margin-top: 30px;
                    margin-left: 20px;">Book Record</h3>
                    <div class="card-body">
                      <h5 class="card-title"><a href="/booked_book" style="text-decoration: none; color: #708090 ">Borrowed Books: </a><%= @borrowed_books.count %></h5>
                      <%= link_to "/reserve_book" do %>
                      <p class="card-title" style="color: #708090 ;font-size: 16px;"><strong>Reserve books: </strong><%= current_user.reservations.count%></p>
                      <% end %>
                      <h5 class="card-title"><a href="/booked_book" style="text-decoration: none; color: #708090 ">over due charge: </a><%= @total_charge %></h5>
                    </div>
                </div> 
                <div class="card" style="width: 18rem; margin: 40px">
                    <!-- <img src="" class="card-img-top" alt="..."> -->
                    <div class="card-body">
                      <h5 class="card-title"><%= current_user.username%></h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div> 
            </div>
        </div>
    </div>
</div>





    ////----------js for book pdf
<% if book.pdf.attached? %>
                <div onclick="showPDF(<%= book.id %>)", id="image-<%= book.id %>">
                  <%= image_tag url_for(book.front_page),
                  class: "w-100", id: "clickable-image",
                  alt: "Sample photo" %>
                </div>
              <!-- </img> -->
              <iframe class="d-none" id="pdf-iframe-<%= book.id %>" width="100%" height="400"></iframe>
                <script>
                  function showPDF(id){
                    $(`#image-${id}`).addClass("d-none")
                    $(`#pdf-iframe-${id}`).removeClass("d-none")
                    // $('#pdf-iframe-1').addClass("d-block")
                    var pdfSrc = "<%= rails_blob_path(book.pdf, disposition: 'inline') %>";
                    pdf-iframe.src = pdfSrc;
                    // pdf-iframe.style.display = 'block';
                  }
                  // var pdfIframe = document.getElementById('pdf-iframe');
                  // var imageElement = document.getElementById('clickable-image');
                  // pdfIframe.style.display = 'none';
                  // imageElement.addEventListener('click', function() {
                  //   // Set the PDF source and make the iframe visible when the image is clicked.
                  //   var pdfSrc = "<%= rails_blob_path(book.pdf, disposition: 'inline') %>";
                  //   pdfIframe.src = pdfSrc;
                  //   pdfIframe.style.display = 'block';
                  //   imageElement.style.display = 'none';
                  // });
                 </script>
              <!-- <%# end %> -->
              <% else %>
              <p>No PDF file attached</p>
              <% end %>





       <% if @book.pdf.attached? %>
                <%= image_tag url_for(@book.front_page),
                class: "w-100", id: "clickable-image",
                alt: "Sample photo" %>
              <!-- </img> -->
              <iframe id="pdf-iframe" width="100%" height="400"></iframe>
                <script>
                  var pdfIframe = document.getElementById('pdf-iframe');
                  var imageElement = document.getElementById('clickable-image');
                  pdfIframe.style.display = 'none';
                  imageElement.addEventListener('click', function() {
                    // Set the PDF source and make the iframe visible when the image is clicked.
                    var pdfSrc = "<%= rails_blob_path(@book.pdf, disposition: 'inline') %>";
                    pdfIframe.src = pdfSrc;
                    pdfIframe.style.display = 'block';
                    imageElement.style.display = 'none';
                  });
                 </script>
              <!-- <%# end %> -->
              <% else %>
              <p>No PDF file attached</p>
              <% end %>
