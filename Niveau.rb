##
# Représente un niveau de jeu, avec sa propre règle et les mains du Joueur ainsi que de l'Adversaire
class Niveau

    attr :nomNiveau
    attr :regle, false  #méthode de type 'typeCartes, typeCartes => Integer'
    attr :typeCartes, false
    attr :mainJoueur, false
    attr :mainAdv, false

    def Niveau.creer(nomNiveau, regle, typeCartes, mainJoueur, mainAdv)
        new(nomNiveau, regle, typeCartes, mainJoueur, mainAdv)
    end

    def initialize(nomNiveau, regle, typeCartes, mainJoueur, mainAdv)
        @nomNiveau = nomNiveau
        @regle = regle
        @typeCartes = typeCartes

        @mainJoueur = mainJoueur
        @mainAdv = mainAdv
    end

    def to_s
        strMainJoueur = mainJoueur.reduce("[ ") {|str, carte| str+carte.to_s+"\n"}
        strMainJoueur += "]"
        strMainAdv = mainAdv.reduce("[ ") {|str, carte| str+carte.to_s+"\n"}
        strMainAdv += "]"

        return "Niveau : #{nomNiveau} \nRègle : #{regle.name} (avec #{typeCartes})\nMain du joueur : \n"+strMainJoueur+"\nMain de l'adversaire : \n"+strMainAdv
    end

    def calculeResultat(carteJoueur,carteAdv)
        @regle.call(carteJoueur,carteAdv)
    end

    def donneMains(joueur,adversaire)
        joueur.prendMain(mainJoueur)
        adversaire.prendMain(mainAdv)
    end
    

end

##
# Prend des CarteSimple
def regleSimple(carteJoueur,carteAdv)
    if carteJoueur < carteAdv
        return -1
    elsif carteJoueur == carteAdv
        return 0
    else
        return 1
    end
end