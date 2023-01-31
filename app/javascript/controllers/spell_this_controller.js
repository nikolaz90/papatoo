import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="spell-this"
export default class extends Controller {
  static targets = [
    'spellword', 'timer', 'level', 'wordcount',
    'encouragement', 'counterAnswerContainer', 'goBtn',
    'submitScore', 'finalScore'
  ]

  library = [
    ["I", "hi", "you", "then", "at", "it", "eat","oh", "for", "tot"],
    ["thus", "then", "art", "truck", "cane", "fog", "glad", "gum", "plain", "prod"],
    ["plane", "fluke", "freed", "cupboard", "thorough", "extent", "content", "crisis", "grape", "tickled"],
    ["house","tractor","event", "unusually", "hydration", "electronically", "example", "omelette","extra", "glass"],
    ["loveable", "terrified", "fraction", "reversed", "faction", "reverbe", "dynamo", "kangaroo", "extracted", "addressed"],
    ["mitigated", "irreversible", "constipated", "descended", "interpreted", "developped", "fantasised", "irradicated", "inexplicable", "calamity"],
    ["bewilderment", "telescopic", "extrapolation", "consequential", "rhetorically", "gravitational", "prehistorical", "establishment", "ravanously", "distinguishment"],
    ["apoptosis", "dodecahedron", "exacerbated", "haphazardly", "enthusiastically", "disappointedly", "unmistakably", "ostentatiously", "commonsensical", "knowledgeable"]
  ]

  encouragement = ["Great - did you learn that at school?", "Nice one!!", "Hey, you can spell something!", "Not too bad after all...!",
                  "Everyone is proud of you!", "Someone somewhere is happy about you", "You can do it!",
                  "Good to see you can write", "You don't have 'bad' spelling!", "Keep going!"]

  correctWords = [];
  level = 0;
  isWinner = false;

  connect() {
    console.log('ready to spell punk?');
  }

  countDown(){
    this.timerTarget.innerText = 9999;
    let interval = setInterval(() => {
      if(this.timerTarget.innerText>0) {
        this.timerTarget.innerText--
      }else{
        if(!this.isWinner) this.stopGameLooser();
        clearInterval(interval);
      }
    }, 10);
  }

  setNewWord(level){
    this.levelTarget.innerText = level + 1
    if(this.spellwordTarget.innerText !== "WORD") this.correctWords.push(this.spellwordTarget.innerText);
    let newWord = this.library[level][this.randomNumber()];
    if(this.correctWords.includes(newWord)) newWord = this.library[level][this.randomNumber()];
    this.spellwordTarget.innerText = newWord;
  }

  randomNumber(){
    return Math.floor(Math.random() * 9);
  }

  userAnswer(e){
    e.preventDefault()
    if(e.target.value.toLowerCase() === this.spellwordTarget.innerText.toLowerCase() && this.level < 8) {
      this.setNewWord(this.level)
      this.setEncouragement(this.encouragement[this.randomNumber()])
      this.wordcountTarget.innerText = this.correctWords.length
      if(this.correctWords.length % 3 === 0) this.level++;
      e.target.value = "";
    }else if (this.level === 8){
      this.stopGameWinner()
    }
  }

  startGame(){
    this.goBtnTarget.style.display = 'none'
    this.counterAnswerContainerTarget.style.display = "flex"
    this.countDown();
    this.setNewWord(0);
  }

  setEncouragement(message) {
    this.encouragementTarget.innerText = `Computer says : ${message}`
  }

  stopGameLooser(){
    this.isWinner = false
    this.setEncouragement("oh dear...")
    this.spellwordTarget.innerHTML = "looser looser looser <br/> ------ <br/> Spell this : <br/> YOU LOOSE <br/> ------ <br/> looser looser looser"
    this.counterAnswerContainerTarget.style.display = "none"
  }

  stopGameWinner(){
    this.isWinner = true
    const score = Number(this.wordcountTarget.innerText) * (9999 - Number(this.timerTarget.innerText));
    this.spellwordTarget.innerHTML = `winner winner winner <br/> ------ <br/> Spell this : <br/> YOU'RE AWESOME <br/> ------ <br/> final score : ${score} <br/> ------ <br/> winner winner winner`;
    this.counterAnswerContainerTarget.style.display = "none";
    this.submitScoreTarget.style.display = "block";
    this.finalScoreTarget.value = score;
  }
}
