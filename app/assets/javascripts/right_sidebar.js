const sideBarId = $("#sidebar-wrapper");

$(document).on('click', '.bt-toggle', {}, function(e) {
  let value = e.target.getAttribute('value')
  let kind = e.target.getAttribute('kind')
  e.preventDefault();
  $("#wrapper").addClass("toggled");
  sidebar_cleaner();
  getInstance(value, kind);
});

function sidebar_cleaner() {
  sideBarId.empty();
  return false;
};


async function getInstance(value, kind) {
  const url = `http://localhost:3000/${kind}/${value}.json`
  try {
    let response = await fetch(url);
    if (response.ok) {
      let instaces = await response.json();
      let profile = JSON.parse(instaces.profile)
      let avatar = instaces.avatar
      console.log(avatar)
      sideBarId.append("<div class='row'><div class='col-12'><div class='card ml-0 text-center' style='width: auto;' id='sidebar-row'></div></div></div>");
      row = $('#sidebar-row');

      row.append("<img class='card-img-top' src=" + `${avatar}` +  " alt=''>");
      row.append("<div class='card-body'></div>");
      cardBody = row.children('.card-body');
      cardBody.append("<img src=" + `${avatar}` + " class='gravatar profile-img rounded mx-auto d-block rounded-circle' width='90' height='90' alt='Avatar'>");
      cardBody.append("<br><h5 class='card-title'>" + `${profile.username}` + '</h5>');
      cardBody.append("<p class='card-text'>" + `${profile.bio}` + '</p>');
      cardBody.append("<a class='btn btn-primary' href='#'>" + 'View profile</a>');
      sideBarId.append("<span class='text-center'><i class='btn close-sidebar fas fa-angle-double-right'></i></span>")
      return instaces;
    }
    throw new Error('Request failed!');
  }
  catch(error) {
    console.log(error);
  }
}

$(document).on('click', '.close-sidebar', {}, function(e) {
  e.preventDefault();
  $("#wrapper").removeClass("toggled");
  sidebar_cleaner();
});
