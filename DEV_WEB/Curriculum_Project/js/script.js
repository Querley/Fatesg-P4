function carregar() {

  const dados = {
    nome: "Querley Junio Rodrigues Ferreira",
    profissao: "Estudante de ADS",

    sobre: "Sou estudante de ADS com interesse em programação e desenvolvimento de software. Atualmente faço estágio e busco evoluir constantemente.",

    formacao: [
      {
        curso: "Análise e Desenvolvimento de Sistemas",
        lugar: "SENAI Fatesg",
        periodo: "2024 - 2026"
      },
      {
        curso: "Técnico em Mecânica",
        lugar: "IFG",
        periodo: "2017 - 2019"
      }
    ],

    habilidades: [
      "HTML",
      "CSS",
      "Java",
      "Python",
      "Git",
      "MySQL"
    ],

    projetos: [
      {
        nome: "Portfólio",
        desc: "Site pessoal simples",
        link: "https://github.com/Querley/CapstoneProject1-Udemy-FullStack"
      },
      {
        nome: "Cine ABC",
        desc: "Sistema de cinema",
        link: "https://github.com/Querley/CineABC"
      }
    ],

    links: [
      {
        nome: "GitHub",
        url: "https://github.com/Querley"
      },
      {
        nome: "LinkedIn",
        url: "https://linkedin.com"
      }
    ],

    contato: "querleyjuniorodriguesferreira@gmail.com"
  }

  document.getElementById("nome").innerText = dados.nome
  document.getElementById("profissao").innerText = dados.profissao
  document.getElementById("sobre").innerText = dados.sobre
  document.getElementById("contato").innerText = dados.contato

  const f = document.getElementById("formacao")
  f.innerHTML = ""
  for (let i = 0; i < dados.formacao.length; i++) {
    const item = dados.formacao[i]

    const div = document.createElement("div")
    div.innerHTML = `
            <h3>${item.curso}</h3>
            <p>${item.lugar}</p>
            <p>${item.periodo}</p>
        `

    f.appendChild(div)
  }

  const h = document.getElementById("habilidades")
  h.innerHTML = ""
  for (let i = 0; i < dados.habilidades.length; i++) {
    const li = document.createElement("li")
    li.innerText = dados.habilidades[i]
    h.appendChild(li)
  }

  const p = document.getElementById("projetos")
  p.innerHTML = ""
  for (let i = 0; i < dados.projetos.length; i++) {
    const pr = dados.projetos[i]

    const div = document.createElement("div")
    div.innerHTML = `
            <h3>${pr.nome}</h3>
            <p>${pr.desc}</p>
            <a href="${pr.link}">Ver projeto</a>
        `

    p.appendChild(div)
  }

  const l = document.getElementById("links")
  l.innerHTML = ""
  for (let i = 0; i < dados.links.length; i++) {
    const link = dados.links[i]

    const li = document.createElement("li")
    li.innerHTML = `<a href="${link.url}">${link.nome}</a>`

    l.appendChild(li)
  }
}
