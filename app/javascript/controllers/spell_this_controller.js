import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="spell-this"
export default class extends Controller {
  static targets = ['spellword', 'timer', 'level', 'wordcount']

  library = [
    ["I", "hi", "you", "then", "at", "it", "eat","oh", "for", "tot"],
    ["thus", "then", "art", "truck", "cane", "fog", "glad", "gum", "plain", "prod"],
    ["plane", "fluke", "freed", "cupboard", "thorough", "extent", "content", "crisis", "grape", "tickled"],
    ["house","tractor","event", "unusually", "hydration", "electronically", "example", "omelette","extra", "glass"],
    ["loveable", "terrified", "fraction", "reversed", "faction", "reverbe", "dynamo", "kangaroo", "extracted", "addressed"],
    ["mitigated", "irreversible", "constipated", "descended", "interpreted", "developped", "fantasised", "irradicated", "inexplicable", "calamity"],
    ["bewilderment", "telescopic", "extrapolation", "consequential", "rhetorically", "gravitational", "prehistorical", "establishment", "ravanously", "distinguishment"],
    ["apoptosis", "dodecahedron", "excacerbated", "haphazardly", "enthusiastically", "disappointedly", "unmistakably", "ostentatiously", "commonsensical", "knowledgeable"]
  ]

  correctWords = [];
  level = 0;

  connect() {
    this.countDown();
    this.setNewWord(0);
  }

  countDown(){
    this.timerTarget.innerText = 9999;
    let interval = setInterval(() => {
      if(this.timerTarget.innerText>0) {
        this.timerTarget.innerText--
      }else{
        this.stopGame();
        clearInterval(interval);
      }
    }, 1);
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
    if(e.target.value === this.spellwordTarget.innerText && this.level < 8) {
      this.setNewWord(this.level)
      this.wordcountTarget.innerText = this.correctWords.length
      if(this.correctWords.length % 3 === 0) this.level++;
      e.target.value = "";
    }
  }

  stopGame(){
    this.spellwordTarget.innerHTML = "looser looser looser <br/> ------ <br/> Spell this : <br/> YOU LOOSE <br/> ------ <br/> looser looser looser"
  }
}
