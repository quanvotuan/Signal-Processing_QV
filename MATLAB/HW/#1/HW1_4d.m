x = -100:0.1:100;
c = 3e8; % speed of light in m/s
dr = 55;
dt = 1e6;
w0 = 300*10^6*pi; % carrier frequency (150 MHz)
t1 = sqrt(x.*x+dt)/c;
t2 = (sqrt((x.*x-2*dr*x+dr^2)+dt)+dr)/c; % expanded sqrt((x-dr)^2 + dt) term
s1 = cos(w0*t1)+cos(w0*t2);
s2 = sin(w0*t1)+sin(w0*t2);
a = sqrt(s1.*s1 + s2.*s2);
plot(x, a);
xlabel('Distance in meters');
ylabel('Amplitude Strength');
grid on