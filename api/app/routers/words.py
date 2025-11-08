from fastapi import APIRouter, Depends, HTTPException
import random

from app.models import Word
from app.schemas import WordResponse
from app.database import get_db
from sqlalchemy.orm import Session


router = APIRouter()

@router.get("/word", response_model=WordResponse)
def get_random_word(db: Session = Depends(get_db)):
    word = db.query(Word).all()

    if not word:
        raise HTTPException(
          status_code=404, 
          detail="No words found")

    random_word = random.choice(word)
    return random_word
