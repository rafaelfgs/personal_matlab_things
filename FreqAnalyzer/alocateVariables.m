note_name = {'C' 'C#' 'D' 'D#' 'E' 'F' 'F#' 'G' 'G#' 'A' 'A#' 'B'};
note_fund = 10^(log10(27.5)-9*(log10(55)-log10(27.5))/12);

is_rec = false;
is_play = false;

t = [0 1];
x = [0 0];

t_cut = [0 1];
x_cut = [0 0];

t_sec = [0 1];
x_sec = [0 0];

pos = [1 2];

freq = [];