<h4> This challenge uses an insurance API in order to create the backbone of a self-employed insurance adviser web app.</h4>

<img width="1432" alt="Capture d’écran 2022-12-15 à 02 47 01" src="https://user-images.githubusercontent.com/90610969/207753274-a0065d93-bf21-48cb-bb0b-aa65521ff7d0.png">

<h3> Use of the platform :</h3>

<p>First, it is preferable if the client logs in the system, even though the simulation is possible without logging in. The system of sign up and log in was installed with the gem Devise.</p>

<p>Then, the client has the possibility to fill in information about his activity. Once done, the system calls the API and diplay the result of the simulation on the right part of the screen, only if the information provided by the client were sufficient to calculate them. Those include all the available covers as well as the advised deductible and coverage ceiling formulas.</p>

<p>Automatically, the simulation is saved when successful and is stored in the database. The client can therefore find all his previous simulations on the bottom of the page and access them whenever he/she wants. </p>


