document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const target = e.target;

    if (target.nodeName !== 'LI') {
      return;
    }

    if (target.className === "visited") {
      target.className = "";
    } else {
      target.className = "visited";
    }
  };

  const restaurants = document.getElementById('restaurants');
  
  restaurants.addEventListener('click', toggleLi);


  // adding SF places as list items

  const restaurantInput = document.querySelector('.favorite-input');
  const restaurantForm = document.querySelector('.list-container form');

  restaurantForm.addEventListener('submit', (event) => {
    event.preventDefault();

    const newRestaurant = restaurantInput.value;
    restaurantInput.value = '';

    if (!newRestaurant) {
      return;
    }

    const li = document.createElement('li');
    li.append(newRestaurant);

    restaurants.appendChild(li);
  });

  
  // adding new photos
  const togglePhotoForm = () => {
    const photoFormContainer = document.querySelector('.photo-form-container');

    photoFormContainer.classList.toggle('hidden');
  };

  const togglePhotoFormButton = document.querySelector('.photo-show-button');
  togglePhotoFormButton.addEventListener('click', togglePhotoForm);

  //
  const handlePhotoSubmit = (event) => {
    event.preventDefault();

    const photoInput = document.querySelector('.photo-url-input');
    const photoList = document.querySelector('.dog-photos');

    const photoUrl = photoInput.value;
    photoInput.value = '';

    const li = document.createElement('li');
    const img = document.createElement('img');
    img.src = photoUrl;
    li.appendChild(img);
    photoList.appendChild(li);

    togglePhotoForm();
  };

  const photoForm = document.querySelector('.photo-form-container form');
  photoForm.addEventListener('submit', handlePhotoSubmit);
});