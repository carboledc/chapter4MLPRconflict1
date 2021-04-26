% Run this script to use the SatelliteTracker to obtain the elevation of 
% the International Space Station from Natick, MA.

% Create a vector of times.
tstart = datetime(2020,10,28);
tspan = days(2);
dt = minutes(5);
t = tstart:dt:(tstart+tspan);

% Read orbital parameters from file.
p = readparameters("iss.txt");

% Calculate and plot the position of the ISS.
[lat,lon] = satelliteposition(t,p);
geoplot(lat,lon)

% Set observer location (latitude, longitude, altitude).
obs = [42.3,-71.35,0.1];

% Calculate and plot elevations.
[trise,tset] = getRiseSet(tstart,tspan,dt,"iss.txt",obs);