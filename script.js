const buttons = document.querySelectorAll('.tab-btn');
const panels = document.querySelectorAll('.tab-panel');

buttons.forEach((button) => {
  button.addEventListener('click', () => {
    const { tab } = button.dataset;

    buttons.forEach((b) => b.classList.remove('active'));
    panels.forEach((p) => p.classList.remove('active'));

    button.classList.add('active');
    document.getElementById(tab)?.classList.add('active');
  });
});
