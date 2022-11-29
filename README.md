<p align="center">
  <h1>Pluto: For happier and healthier pet families</h1>
<div style="display: flex" align="center">
<img src="https://user-images.githubusercontent.com/74501096/188362094-22046560-dd36-40f1-8623-3b9e7f08d8e6.jpg" width="225px">
<img src="https://user-images.githubusercontent.com/74501096/188362086-950851d7-0e20-41a8-ae49-9d48b5df358d.jpg" width="225px">
<img src="https://user-images.githubusercontent.com/74501096/188362092-a26f72cd-cdf7-4a70-914b-c98a175d195e.jpg" width="225px">
<img src="https://user-images.githubusercontent.com/74501096/188362080-fa0b3c36-f52e-4eaf-9bff-efb045900133.jpg" width="225px">



</div>
</p>
<div class="table-of-contents">
  <ul>
    <li><a href="#introduction">Introduction</a></li>
    <li><a href="#setup">Setting Up</a></li>
    <li><a href="#techstack">Tech Stack</a></li>
    <li><a href="#viewlive">View Live App</a></li>
    <li><a href="#demo">Demo (Coming soon)</a></li>
    <li><a href="#devteam">Our Developer Team</a></li>
  </ul> 
</div>
<div id="introduction">
  <h1>Introduction</h1>
  <p>Pets are precious living creatures and there are lots of things you need to do to make sure they live both happy and healthy lives.</p>
  <p>Pluto is a one stop app where you can log your pets medical information, make daily journal entries and much more. Furthermore, Pluto makes it easy to share this information between family members and pet sitters alike. </p>
  <p>This app was made with love by <a href="#devteam">Our Pluto Team</a> as the final project for Le Wagon Tokyo #batch848.</p>
</div>
<div id="setup">
<h1>Setup</h1>

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```
</div>

<div id="techstack">
  <h2 align="left">Our Tech Stack</h2>
  <a href="https://getbootstrap.com" target="_blank"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bootstrap/bootstrap-plain-wordmark.svg" alt="bootstrap" width="40" height="40"/> </a> 
  <a href="https://www.w3schools.com/css/" target="_blank"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/css3/css3-original-wordmark.svg" alt="css3" width="40" height="40"/> </a> <a href="https://www.figma.com/" target="_blank"> <img src="https://www.vectorlogo.zone/logos/figma/figma-icon.svg" alt="figma" width="40" height="40"/> </a> <a href="https://git-scm.com/" target="_blank"> <img src="https://www.vectorlogo.zone/logos/git-scm/git-scm-icon.svg" alt="git" width="40" height="40"/> </a> <a href="https://heroku.com" target="_blank"> <img src="https://www.vectorlogo.zone/logos/heroku/heroku-icon.svg" alt="heroku" width="40" height="40"/> </a> <a href="https://www.w3.org/html/" target="_blank"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/html5/html5-original-wordmark.svg" alt="html5" width="40" height="40"/> </a> <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript" target="_blank"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/javascript/javascript-original.svg" alt="javascript" width="40" height="40"/> </a> <a href="https://www.postgresql.org" target="_blank"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/postgresql/postgresql-original-wordmark.svg" alt="postgresql" width="40" height="40"/> </a> <a href="https://rubyonrails.org" target="_blank"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/rails/rails-original-wordmark.svg" alt="rails" width="40" height="40"/> </a> <a href="https://www.ruby-lang.org/en/" target="_blank"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/ruby/ruby-original.svg" alt="ruby" width="40" height="40"/> </a> <a href="https://sass-lang.com" target="_blank"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/sass/sass-original.svg" alt="sass" width="40" height="40"/> </a> <a href="https://webpack.js.org" target="_blank"> <img src="https://raw.githubusercontent.com/devicons/devicon/d00d0969292a6569d45b06d3f350f463a0107b0d/icons/webpack/webpack-original-wordmark.svg" alt="webpack" width="40" height="40"/> </a>
    <a href="https://developers.line.biz/en/" target="_blank"> <img src="https://i.imgur.com/pXrz4Xd.jpg" alt="webpack" width="40" height="40"/> </a>
</div>

<div id="viewlive">
  <h2>View our App live</h2>
  <a href="https://www.pluto-pets.me/">Pluto</a>
</div>

<div id="demo">
  <h2>Watch our demo day presentation</h2>
  <h3>Coming Soon...</h3>
</div>

<div id="devteam">
  <h2>Our Dev team: The Plutionians</h2>
  <p><b>Project Manager:</b> Kenneth Ashmore</p>
  <p><b>Lead Developer:</b> Jessica Nash</p>
  <p><b>Back End Lead:</b> Tyler Hennig</p>
  <p><b>Front End Developer & Pluto Ideator:</b> Nicole Oliver</p>
</div>
