var n;
function setup() {
  createCanvas(400, 400);
  n=0;
}

function draw() {
  if (n==256) {
    n = 0;
  }
  background(n);
  n++;
}
