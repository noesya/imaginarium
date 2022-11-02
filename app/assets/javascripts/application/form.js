var form = document.querySelector('.js-form-steps'),
  steps,
  attributeName = "data-show-step",
  stepIndex = 0;

function setupStepsForm() {
  var buttons = form.querySelectorAll('[' + attributeName + ']'),
    stepIndex = 0;

  steps = form.querySelectorAll('.js-step');

  buttons.forEach(function(button) {
    button.addEventListener('click', function () {
      stepIndex = parseInt(button.getAttribute(attributeName), 10);
      showStep(stepIndex);
    });
  });

  interceptEnterKey();
}

function showStep(index) {
  stepIndex = index;
  form.setAttribute('data-step-index', (index + 1));
  steps.forEach(function(step, i) {
    if (i === index) {
      step.classList.add('is-visible');
      step.querySelector('input').focus();
    } else {
      step.classList.remove('is-visible');
    }
  });
}

function interceptEnterKey() {
  form.addEventListener('keydown', function(event) {
    if (event.key === 'Enter' &&  stepIndex < steps.length-1 ) {
      event.preventDefault();
      showStep(stepIndex + 1);
    }
  });
}

if (form) {
  setupStepsForm();
}
