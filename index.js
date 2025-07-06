import {defibank} from "../../declarations/defibank";

window.addEventListener("load", async function() {
    // const currentAmount = await defibank.checkBalance();
    // document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
    update();
});

document.querySelector("form").addEventListener("submit", async function(event){
    event.preventDefault();
    const button = event.target.querySelector("#submit-btn");
    const inputAmount = parseFloat(document.getElementById("input-amount").value);
    const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

    button.setAttribute("disabled", true);
    if (document.getElementById("input-amount").value.length != 0){
        await defibank.topUp(inputAmount);
    }

    if (document.getElementById("withdrawal-amount").value.length != 0){
        await defibank.withdrawl(outputAmount);
    }
    
    await defibank.compound();

    // const currentAmount = await defibank.checkBalance();
    // document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
    update();
    document.getElementById("input-amount").value = "";
    button.removeAttribute("disabled");
});

async function update() {
    const currentAmount = await defibank.checkBalance();
    document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
};
