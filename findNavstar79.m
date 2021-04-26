% Run this script to use the SatelliteTracker to obtain the elevation of 
% the NavStar 79 Satellite from Natick, MA.

% Create a vector of times.
tstart = datetime(2020,10,28);
tspan = days(2);
dt = minutes(5);
t = tstart:dt:(tstart+tspan);

% Read orbital parameters from file.
p = readparameters("navstar79.txt");

% Calculate and plot the position of the NavStar 79 Satellite.
[lat,lon] = satelliteposition(t,p);
geoplot(lat,lon)

% Set observer location (latitude, longitude, altitude).
obs = [42.3,-71.35,0.1];

% Calculate and plot elevations.
[trise,tset] = getRiseSet(tstart,tspan,dt,"navstar79.txt",obs);
